//
//  JPViewController.h
//  jparr053-p4
//
//  Created by Jonathan Parrilla on 2/16/14.
//  Copyright (c) 2014 Jonathan Parrilla. All rights reserved.
//

/*
 
 PROGRAMMER: Jonathan Parrilla
 
 PANTHER ID: 3767284
 
 CLASS: COP 4655 MW 5:00 PM
 
 INSTRUCTOR: Steven Luis
 
 ASSIGNMENT: Program 4 - Address Book (Jparr053-p4)
 
 DUE: Wednesday 2/19/2014
 
 */

#import <UIKit/UIKit.h>
@class JPAddressBook;
@class JPAddressCard;

@interface JPViewController : UIViewController <UITextFieldDelegate>

@property JPAddressBook *book1;

- (IBAction)newButtonPressed:(id)sender;

- (IBAction)updateButtonPressed:(id)sender;

- (IBAction)previousButtonPressed:(id)sender;

- (IBAction)nextButtonPressed:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *nameField;


@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UILabel *warningLabel;

@end
