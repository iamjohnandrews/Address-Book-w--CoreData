//
//  Person.h
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Person : NSManagedObjectContext


@property (strong,nonatomic) NSString* firstName;

@property (strong,nonatomic) NSString* lastName;

@property (strong,nonatomic) NSString* emailAddress;

@property (strong,nonatomic) NSString* phoneNumber;


-(void)initWithDictionary: (NSDictionary*)dict;

- (void)createPersonForAddressBook;

- (void)readPeronsContactInformation;

- (void)updateAPersonsContactInformation;

- (void)deletePersonFromAddressBook;

- (void)saveModifiedPersonToCoreData;


@end
