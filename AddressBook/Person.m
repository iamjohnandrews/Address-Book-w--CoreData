//
//  Person.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "Person.h"
#import "AppDelegate.h"

@implementation Person
{
    NSManagedObjectContext* _managedObjectContext;
}
@dynamic firstName, lastName, emailAddress, phoneNumber;


- (void)initWithDictionary:(NSDictionary*)dictionary
{
    
    
}


//CRUDS
- (void)createPersonForAddressBook
{
    //make the text user enters equal to a new person
}

- (void)readPeronsContactInformation
{
    //view the must up-to-date information about a person
}

- (void)updateAPersonsContactInformation
{
    //make edits to someone currenttly in address book and make users updates equal to current person
}
- (void)deletePersonFromAddressBook
{
    //delete a person from CoreData
}

- (void)saveModifiedPersonToCoreData
{
    //save a person to CoreData
    NSError* error;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"failed to save error:%@", error.userInfo);
    }
}


@end

