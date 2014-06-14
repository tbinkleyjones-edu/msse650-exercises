//
//  ViewController.m
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/21/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
//#import "ContactSvcCache.h"
//#import "ContactSvcArchive.h"
#import "ContactSvcSQLite.h"

@interface ViewController ()

@end

@implementation ViewController

//ContactSvcCache *contactSvc = nil;
//ContactSvcArchive *contactSvc = nil;
ContactSvcSQLite *contactSvc = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    contactSvc = [[ContactSvcSQLite alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveContact:(id)sender {
    NSLog(@"saveContact");
    
    [self.view endEditing:YES];
    
    Contact *contact = [[Contact alloc] init];
    contact.name = _name.text;
    contact.phone = _phone.text;
    contact.email = _email.text;
    [contactSvc createContact:contact];
    
    [self.tableView reloadData];
    NSLog(@"saveContact: contact saved!");
}

- (IBAction)deleteContact:(id)sender {
    NSLog(@"deleteContact");
    
    [self.view endEditing:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[contactSvc retrieveAllContacts] count];
    NSLog(@"number of rows in section %ld: %ld", (long)section, (long)count);
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"retrieving cell for row at index path %@", indexPath);

    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Contact *contact = [[contactSvc retrieveAllContacts] objectAtIndex:indexPath.row];
    cell.textLabel.text = [contact description];
    return cell;
}

@end
