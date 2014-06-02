//
//  ContactOperationDelegate.h
//  ContactMgrSB
//
//  Created by Tim Binkley-Jones on 6/1/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContactOperationDelegate <NSObject>

- (void) updateContact:(Contact *)contact;

@end
