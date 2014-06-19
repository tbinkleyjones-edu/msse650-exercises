//
//  ViewController.h
//  ContactMgr
//
//  Created by Timothy Binkley-Jones on 5/21/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)saveContact:(id)sender;
- (IBAction)deleteContact:(id)sender;

@end
