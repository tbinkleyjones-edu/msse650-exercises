//
//  Contact.h
//  ContactMgrCD
//
//  Created by Tim Binkley-Jones on 6/18/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * email;

@end
