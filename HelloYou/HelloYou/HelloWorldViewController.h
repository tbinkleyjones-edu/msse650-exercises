//
//  HelloWorldViewController.h
//  HelloYou
//
//  Created by Tim Binkley-Jones on 5/10/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)sayHello:(id)sender;

@end
