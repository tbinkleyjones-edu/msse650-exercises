//
//  ContactSvc.h
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/22/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Contact.h"

@protocol ContactsSvc <NSObject>

- (Contact *) createContact: (Contact *) contact;
- (NSMutableArray *) retrieveAllContacts;
- (Contact *) udpateContact: (Contact *) contact;
- (Contact *) deleteContact: (Contact *) contact;

@end
