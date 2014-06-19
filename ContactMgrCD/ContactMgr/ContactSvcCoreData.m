//
//  ContactSvcCoreData.m
//  ContactMgrCD
//
//  Created by Tim Binkley-Jones on 6/18/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ContactSvcCoreData.h"

@implementation ContactSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

- (id) init {
    if (self = [super init]) {
        [self initializeCoreData];
        return self;
    }
    return nil;
}

-(void) initializeCoreData {
    // initialize (load) the schema model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    // initialize the persistent store coordinator with the model
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];

    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"ContactsMgr.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // initialize the managed object context
        moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    } else {
        NSLog(@"initializeCoreData FAILED with error: %@", error);
    }
}

- (Contact *) createManagedContact {
    Contact * contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:moc];
    return contact;
}

- (Contact *) createContact: (Contact *) contact {
    Contact *managedContact = [self createManagedContact];
    managedContact.name = contact.name;
    managedContact.phone = contact.phone;
    managedContact.email = contact.email;
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"createContact ERROR: %@", [error localizedDescription]);
    }
    return managedContact;
}

- (NSArray *) retrieveAllContacts {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];

    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

- (Contact *) updateContact: (Contact *) contact{
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"updateContact ERROR: %@", [error localizedDescription]);
    }
    return contact;
}

- (Contact *) deleteContact: (Contact *) contact {
    [moc deleteObject:contact];
    return contact;
}

@end
