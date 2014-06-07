//
//  ContactSvcArchive.m
//  ContactMgr
//
//  Created by Tim Binkley-Jones on 6/7/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ContactSvcArchive.h"

@implementation ContactSvcArchive

NSString *filePath;
NSMutableArray *contacts;

- (id)init {
    // find the document directory
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];

    // append file name
    filePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"Contacts.archive"]];

    [self reachArchive];

    return self;
}

- (void)reachArchive {
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:filePath]) {
        contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    } else {
        contacts = [NSMutableArray array];
    }
}

- (void)writeArchive {
    [NSKeyedArchiver archiveRootObject:contacts toFile:filePath];

}

- (Contact *)createContact:(Contact *)contact {
    [contacts addObject:contact];
    [self writeArchive];
    return contact;
}

- (NSMutableArray *)retrieveAllContacts {
    return contacts;
}

- (Contact *)updateContact:(Contact *)contact {
    [self writeArchive];
    return contact;
}

- (Contact *)deleteContact:(Contact *)contact {
    [contacts removeObject: contact];
    [self writeArchive];
    return contact;
}

@end
