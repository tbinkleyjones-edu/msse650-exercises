//
//  ContactSvcArchive.m
//  ContactMgr
//
//  Created by Tim Binkley-Jones on 6/7/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactSvc.h"
#import "ContactSvcArchive.h"

@interface ContactSvcArchiveTests : XCTestCase

@end

@implementation ContactSvcArchiveTests

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
    ContactSvcArchive *service = [[ContactSvcArchive alloc] init];
    NSInteger initialCount = [service retrieveAllContacts].count;

    Contact *contact = [[Contact alloc] init];
    contact.name = @"Joe User";

    [service createContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, initialCount + 1);

    contact.phone = @"8675309";
    [service updateContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, initialCount + 1);

    NSInteger indexOfContact = [[service retrieveAllContacts] indexOfObject:contact];
    Contact *updatedContact = [[service retrieveAllContacts] objectAtIndex:indexOfContact];
    XCTAssertEqual(updatedContact.phone, @"8675309");

    [service deleteContact:contact];
    XCTAssertEqual([service retrieveAllContacts].count, initialCount);
}


@end
