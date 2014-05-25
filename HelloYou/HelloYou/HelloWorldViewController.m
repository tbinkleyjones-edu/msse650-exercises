//
//  HelloWorldViewController.m
//  HelloYou
//
//  Created by Tim Binkley-Jones on 5/10/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController

@synthesize label = _label;
@synthesize textField = _textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sayHello:(id)sender {
    NSString *nameString = self.textField.text;
    if ([nameString length] == 0) {
        nameString = @"World";
    }

    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    self.label.text = greeting;

    [greeting standUpAndClap];
}

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

@end
