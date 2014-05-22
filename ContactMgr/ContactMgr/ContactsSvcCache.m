//
//  ContactSvcCache.m
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/22/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ContactsSvcCache.h"

@implementation ContactsSvcCache : NSObject 

NSMutableArray *contacts = nil;

- (id) init {
    if (self = [super init]) {
        contacts = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Contact *) createContact: (Contact *) contact {
    [contacts addObject:contacts];
    return contact;
}

- (NSMutableArray *) retrieveAllContacts {
    return contacts;
}

- (Contact *) udpateContact: (Contact *) contact {
    return contact;
}

- (Contact *) deleteContact: (Contact *) contact {
    return contact;
}



@end
