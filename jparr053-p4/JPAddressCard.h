//
//  JPAddressCard.h
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


#import <Foundation/Foundation.h>

@interface JPAddressCard : NSObject

< NSCopying, NSCoding >

@property (nonatomic, copy) NSString *name, *email;

-( void) setName: (NSString *) theName andEmail: (NSString *) theEmail;
-( void) assignName: (NSString *) theName andEmail: (NSString *) theEmail;
-( NSComparisonResult) compareNames: (id) element;

-( void) print;

@end
