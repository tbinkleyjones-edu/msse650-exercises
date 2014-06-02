//
//  DetailViewController.h
//  ContactMgrSB
//
//  Created by Tim Binkley-Jones on 5/29/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "ContactOperationDelegate.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak) id <ContactOperationDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (IBAction)saveBeforeUnwindSeque:(id)sender;

@end
