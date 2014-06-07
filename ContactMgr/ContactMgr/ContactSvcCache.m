//
//  ContactSvcCache.m
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/22/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ContactSvcCache.h"

@implementation ContactSvcCache : NSObject 

NSMutableArray *contacts = nil;

- (id) init {
    if (self = [super init]) {
        contacts = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Contact *) createContact: (Contact *) contact {
    [contacts addObject:contact];
    return contact;
}

- (NSMutableArray *) retrieveAllContacts {
    return contacts;
}

- (Contact *) updateContact: (Contact *) contact {
    return contact;
}

- (Contact *) deleteContact: (Contact *) contact {
    [contacts removeObject: contact];
    return contact;
}



@end
