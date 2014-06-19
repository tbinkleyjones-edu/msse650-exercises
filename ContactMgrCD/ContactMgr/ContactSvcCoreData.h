//
//  ContactSvcCoreData.h
//  ContactMgrCD
//
//  Created by Tim Binkley-Jones on 6/18/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactSvc.h"

@interface ContactSvcCoreData : NSObject <ContactSvc>

- (Contact *) createManagedContact;

@end
