//
//  JPViewController.m
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

#import "JPViewController.h"
#import "JPAddressCard.h"
#import "JPAddressBook.h"

@implementation JPViewController

@synthesize book1;

@synthesize nameField, emailField;

@synthesize warningLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Allocate and Initialize the address book, book1.
    book1 = [[JPAddressBook alloc] initWithName:@"Jonathan's Address Book"];
    
    // Sort the address book.
    [book1 sort2];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// What to do when the New button is pressed.
- (IBAction)newButtonPressed:(id)sender
{
    // Clear the name and email fields.
    nameField.text = @"";
    emailField.text = @"";
    
    // Hide the warning label in case it is showing.
    warningLabel.hidden = true;
    
    // Reset the indexNumber.
    [book1 resetIndexNumber];
}


// What to do when the update button is pressed.
- (IBAction)updateButtonPressed:(id)sender
{
    JPAddressCard *aCard = [[JPAddressCard alloc] init];
    
    if(([nameField.text isEqualToString:@""]) || ([emailField.text isEqualToString:@""]))
    {
        // Display a warning label telling the user to fill in ALL the fields.
        warningLabel.hidden = false;
    }
    else if((![nameField.text isEqualToString:@""]) && (![emailField.text isEqualToString:@""]))
    {
        // Look up the name in the name field to see if this is an update of an existing card.
        aCard = [book1 lookup:nameField.text];
    
        // If the card already exists, do the following.
        if(aCard != nil)
        {
            // Remove the card
            [book1 removeCard:aCard];
        
            // Set the name and email
            [aCard setName:nameField.text andEmail:emailField.text];
        
            // Add Updated card to the address book
            [book1 addCard:aCard];
        
            // Sort the address book (As a precaution)
            [book1 sort2];
        
            // Clear the name and email text fields.
            nameField.text = @"";
            emailField.text = @"";
        
            // Reset the indexNumber
            [book1 resetIndexNumber];
        }
    
        // If it is an update in terms of adding a new card, then do the following.
        else
        {
            // Create a new card
            JPAddressCard *newCard = [[JPAddressCard alloc]init];
    
            // Set the name and email on the card.
            [newCard setName:nameField.text andEmail:emailField.text];
    
            // Add the card to the address book.
            [book1 addCard:newCard];
    
            // Sort the address book
            [book1 sort2];
    
            // Clear the name and email text fields.
            nameField.text = @"";
            emailField.text = @"";
        
            // Reset the indexNumber
            [book1 resetIndexNumber];
        }
    }
    
}

// What to do when the Previous button is pressed.
- (IBAction)previousButtonPressed:(id)sender
{
    //Hide the warning label if it is present.
    warningLabel.hidden = true;
    
    // Create a JPAddressCard and assign it the previous card using the "previousCard" method from the JPAddressBook Class.
    JPAddressCard *currentCard = [book1 getPreviousCard];
    
    // Display the name and email in their appropriate fields.
    nameField.text = currentCard.name;
    emailField.text = currentCard.email;

}


// What to do when the Next Button is pressed.
- (IBAction)nextButtonPressed:(id)sender
{
    // Hide the warning label if it is present.
    warningLabel.hidden = true;
    
    // Create a JPAddressCard and assign it the next card using the "nextCard" method from the JPAddressBook Class.    
    JPAddressCard *currentCard = [book1 getNextCard];
    
    // Display the name and email in their appropriate fields.
    nameField.text = currentCard.name;
    emailField.text = currentCard.email;
    
}


// UITextField Delegate Methods that I implemented. All of them are optional.

// This method makes the keyboard disappear whenever ANYTHING on the screen is touched that is not the keyboard.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


// This method makes the keyboard disappear after pressing return, but first checks if you are on the first field, namely the "Name" field. If you are, then it takes you to the "Email" field.
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag == 0)
    {
        [emailField becomeFirstResponder];
    }
    else
    {
        [nameField resignFirstResponder];
    }
    
    return YES;
}




@end
