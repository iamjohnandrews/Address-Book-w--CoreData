//
//  CoreDataClass.h
//  AddressBook
//
//  Created by John Andrews on 10/16/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface CoreDataClass : NSObject


+ (void)createPersonForAddressBookWithFirstName:(NSString*)firstName LastName:(NSString*)lastName PhoneNumber:(NSString*)phoneNumber EmailAddress:(NSString*)emailAddress HomeStreetAddress:(NSString*)homeStreetAddress HomeCity:(NSString*)homeCity HomeState:(NSString*)homeState HomeZipCode:(NSString*)homeZipCode WorkStreetAddress:(NSString*)workStreetAddress WorkCity:(NSString*)workCity WorkState:(NSString*)workState WorkZipCode:(NSString*)workZipCode;

+ (NSArray*)fetchPeronsContactInformation;

- (void)updateAPersonsContactInformation:(Person*)currentContact;

//- (void)deletePersonFromAddressBook:(Person*)currentContact;

+ (void)saveModifiedPersonToCoreData;

@end
