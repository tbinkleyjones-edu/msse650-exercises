//
//  DetailViewController.m
//  ContactMgrSB
//
//  Created by Tim Binkley-Jones on 5/29/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.name.text = [self.detailItem name];
        self.phone.text = [self.detailItem phone];
        self.email.text = [self.detailItem email];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
  // Do any additional setup afterafter loading the view, typically from a nib.

 // Create a new item for the back button
 UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"< Back" style:UIBarButtonItemStylePlain target:self action:@selector(checkDetailWork)];

 // Put the new item into the left bar button item position (replacing the default back button).
 [[self navigationItem] setLeftBarButtonItem:barButtonItem];
 [self configureView];
 }



 Then add a new method, also in the detail view controller...

 - (void)checkDetailWork
 {
 NSLog(@"do something here before the detail view gets popped");

 // Then pop the detail view off the navigation stack.
 [[self navigationController] popViewControllerAnimated:YES];

 }


 */

-(void)  viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"\n\nviewWillDisappear called");
    return ;
}

- (IBAction)saveBeforeUnwindSegue:(id)sender {
    NSLog(@"saveBEforeUnwindSegue");
//    [self.detailItem setName: _name.text];
//    [self.detailItem setPhone: _phone.text];
//    [self.detailItem setEmail: _email.text];
//    [[self navigationController] popViewControllerAnimated:YES];
}
@end
