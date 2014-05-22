//
//  Contact.m
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/22/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *) description {
    return [NSString stringWithFormat: @"%@ %@ %@", _name, _phone, _email];
}

@end
