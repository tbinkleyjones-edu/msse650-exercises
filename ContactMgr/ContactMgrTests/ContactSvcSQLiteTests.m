//
//  ContactSvcSQLiteTests.m
//  ContactMgr
//
//  Created by Tim Binkley-Jones on 6/10/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactSvcSQLite.h"

@interface ContactSvcSQLiteTests : XCTestCase

@end

@implementation ContactSvcSQLiteTests

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
    ContactSvcSQLite *service = [[ContactSvcSQLite alloc] init];
    NSInteger initialCount = [service retrieveAllContacts].count;

    Contact *contact = [[Contact alloc] init];
    contact.name = @"Joe User";

    [service createContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, initialCount + 1);

    contact.phone = @"8675309";
    [service updateContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, initialCount + 1);

    // find the contact with the same id
    Contact *updatedContact = nil;
    for (Contact *next in [service retrieveAllContacts]) {
        if (next.id == contact.id) {
            updatedContact = next;
            break;
        }
    }

    XCTAssertTrue([updatedContact.phone isEqualToString:@"8675309"], @"phone numbers do not match");

    [service deleteContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, initialCount);
}
@end
