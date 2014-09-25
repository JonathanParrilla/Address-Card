//
//  JPAddressBook.h
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
//#import "JPAddressCard.h"
@class JPAddressCard;

@interface JPAddressBook : NSObject
< NSCopying, NSCoding >

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

-( id) initWithName: (NSString *) name;
-( void) sort;
-( void) sort2;
-( void) addCard: (JPAddressCard *) theCard;
-( void) removeCard: (JPAddressCard *) theCard;
-( NSUInteger) entries;
-( void) resetIndexNumber;
-( void) list;
-( JPAddressCard *) lookup: (NSString *) theName;
-(JPAddressCard *) getPreviousCard;
-(JPAddressCard *) getNextCard;

@end
