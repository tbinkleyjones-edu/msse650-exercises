//
//  ContactSvcSQLite.m
//  ContactMgr
//
//  Created by Tim Binkley-Jones on 6/10/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ContactSvcSQLite.h"
#import <sqlite3.h>

@implementation ContactSvcSQLite

NSString *databasePath = nil;
sqlite3 *database = nil;

- (id) init {
    if (self = [super init]) {
        // find the document directory
        NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsDir = [dirPaths objectAtIndex:0];

        // append file name
        databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"contact.sqlite3"]];

        // open the database (it will be created if it does not exist)
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);

            NSString *createSql =
                @"CREATE TABLE IF NOT EXISTS contact (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(30), phone VARCHAR(12), email VARCHAR(20))";
            char *errMsg;
            if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errMsg) != SQLITE_OK) {
                NSLog(@"Failed to create table %s", errMsg);
            }

        } else {
            NSLog(@"*** Failed to open database!");
            NSLog(@"*** SQL error: %ss\n", sqlite3_errmsg(database));
        }
    }
    return self;
}

- (void)dealloc {
    sqlite3_close(database);
}

- (Contact *) createContact: (Contact *) contact {
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat:
                           @"INSERT INTO contact (name, phone, email) VALUES (\"%@\", \"%@\", \"%@\")",
                           contact.name, contact.phone, contact.email];

    if (sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            contact.id = sqlite3_last_insert_rowid(database);
            NSLog(@"*** Contact added");
        } else {
            NSLog(@"*** Contact NOT added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }

    return contact;
}

- (NSMutableArray *) retrieveAllContacts {
    NSMutableArray *contacts = [NSMutableArray array];

    sqlite3_stmt *statement;
    NSString *selectSQL = [NSString stringWithFormat:
                           @"SELECT * FROM contact ORDER BY name"];

    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** Contacts retrieved");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int id = sqlite3_column_int(statement, 0);
            char *nameChars = (char *)sqlite3_column_text(statement, 1);
            char *phoneChars = (char *)sqlite3_column_text(statement, 2);
            char *emailChars = (char *)sqlite3_column_text(statement, 3);

            Contact *contact = [[Contact alloc] init];
            contact.id = id;
            contact.name = [[NSString alloc] initWithUTF8String:nameChars];
            contact.phone = [[NSString alloc] initWithUTF8String:phoneChars];
            contact.email = [[NSString alloc] initWithUTF8String:emailChars];

            [contacts addObject:contact];
        }
        sqlite3_finalize(statement);
    } else {
        NSLog(@"*** Contacts NOT retrieved");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }

    return contacts;
}

- (Contact *) updateContact: (Contact *) contact {
    sqlite3_stmt *statement;
    NSString *updateSQL = [NSString stringWithFormat:
                           @"UPDATE contact set name=\"%@\", phone=\"%@\", email=\"%@\" WHERE id=%li",
                           contact.name, contact.phone, contact.email, (long)contact.id];

    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            contact.id = sqlite3_last_insert_rowid(database);
            NSLog(@"*** Contact updated");
        } else {
            NSLog(@"*** Contact NOT updated");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }

    return contact;
}

- (Contact *) deleteContact: (Contact *) contact {
    sqlite3_stmt *statement;
    NSString *deleteSQL = [NSString stringWithFormat:
                           @"DELETE FROM contact WHERE id=%li",
                           (long)contact.id];

    if (sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Contact deleted");
        } else {
            NSLog(@"*** Contact NOT deleted");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }

    return contact;
}

@end
