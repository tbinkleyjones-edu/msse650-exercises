//
//  ContactSvcCacheTest.m
//  ContactMgr
//
//  Created by Tim Binkley-Jones on 5/31/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactsSvcCache.h"

@interface ContactSvcsCacheTests : XCTestCase

@end

@implementation ContactSvcsCacheTests

//- (void)setUp
//{
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//}
//
//- (void)tearDown
//{
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}

- (void)testAddUpdateAndRemoveContacts
{
    ContactsSvcCache *service = [[ContactsSvcCache alloc] init];
    XCTAssertEqual([service retrieveAllContacts].count, 0);

    Contact *contact = [[Contact alloc] init];
    contact.name = @"Joe User";

    [service createContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, 1);

    contact.phone = @"8675309";
    [service udpateContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, 1);
    Contact *updatedContact = [[service retrieveAllContacts] objectAtIndex:0];
    XCTAssertEqual(updatedContact.phone, @"8675309");

    [service deleteContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, 0);
}

@end
