//
//  Contact.m
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/22/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "Contact.h"

static NSString *const NAME = @"name";
static NSString *const PHONE = @"phone";
static NSString *const EMAIL = @"email";

@implementation Contact

- (NSString *) description {
    return [NSString stringWithFormat: @"%@ %@ %@", _name, _phone, _email];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    // encode with property values
    [coder encodeObject:self.name forKey:NAME];
    [coder encodeObject:self.phone forKey:PHONE];
    [coder encodeObject:self.email forKey:EMAIL];
}

- (id)initWithCoder:(NSCoder *)coder {
    // decode the property values
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:NAME];
        _phone = [coder decodeObjectForKey:PHONE];
        _email = [coder decodeObjectForKey:EMAIL];
    }
    return self;
}

@end
