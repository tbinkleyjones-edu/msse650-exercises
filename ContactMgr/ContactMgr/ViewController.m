//
//  ViewController.m
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/21/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "ContactsSvcCache.h"

@interface ViewController ()

@end

@implementation ViewController

ContactsSvcCache *contactsSvc = nil;

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
    
    contactsSvc = [[ContactsSvcCache alloc] init];
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
    [contactsSvc createContact:contact];
    
    [self.tableView reloadData];
    NSLog(@"saveContact: contact saved!");
}

- (IBAction)deleteContact:(id)sender {
    NSLog(@"deleteContact");
    
    [self.view endEditing:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[contactsSvc retrieveAllContacts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Contact *contact = [[contactsSvc retrieveAllContacts] objectAtIndex:indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

@end
