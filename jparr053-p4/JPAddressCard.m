//
//  JPAddressCard.m
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

#import "JPAddressCard.h"

@implementation JPAddressCard
@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}
// Compare the two names from the specified address cards
-( NSComparisonResult) compareNames: (id) element
{
    return [name compare: [element name]];
}

-(void) print
{
    NSLog (@" ====================================");
    NSLog (@" |                                  |");
    NSLog (@" | %-31s |", [name UTF8String]);
    NSLog (@" | %-31s |", [email UTF8String]);
    NSLog (@" | |");
    NSLog (@" | |");
    NSLog (@" | |");
    NSLog (@" | O O |");
    NSLog (@" ====================================");
}

-(id) copyWithZone: (NSZone *) zone
{
    id newCard = [[[ self class] allocWithZone: zone] init];
    
    [newCard assignName: name andEmail: email];
    
    return newCard;
}

-(void) assignName: (NSString *) theName andEmail: (NSString *) theEmail
{
    name = theName;
    email = theEmail;
}

-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject: name forKey: @" AddressCardName"];
    [encoder encodeObject: email forKey: @" AddressCardEmail"];
}

-(id) initWithCoder: (NSCoder *) decoder
{
    name = [decoder decodeObjectForKey: @" AddressCardName"];
    email = [decoder decodeObjectForKey: @" AddressCardEmail"];
    
    return self;
}

@end

