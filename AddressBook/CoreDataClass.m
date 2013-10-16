//
//  CoreDataClass.m
//  AddressBook
//
//  Created by John Andrews on 10/16/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "CoreDataClass.h"
#import <CoreData/CoreData.h>
#import "Person.h"
#import "AddPersonViewController.h"
#import "EditPersonViewController.h"
#import "ShowPersonViewController.h"
#import "AppDelegate.h"

@implementation CoreDataClass
{
    NSManagedObjectContext* _managedObjectContext;
}


//CRUDS
+ (void)createPersonForAddressBookWithFirstName:(NSString*)firstName LastName:(NSString*)lastName PhoneNumber:(NSString*)phoneNumber EmailAddress:(NSString*)emailAddress
{
    //make the text user enters (located in AddPersonViewController) equal to a new person
    Person* newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext]];
    
    newContact.firstName = firstName;
    newContact.lastName = lastName;
    newContact.emailAddress = emailAddress;
    newContact.phoneNumber = phoneNumber;
}

+ (NSArray*)fetchPeronsContactInformation
{
    //view the must up-to-date information about a person from CoreData
    NSError* error;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];

    fetchRequest.sortDescriptors = [NSArray arrayWithObjects:[[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES], nil];
    
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext]];
    fetchRequest.entity = entityDescription;
    
    NSArray* fetchedObjects = [[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@"Errors are %@", error);
    
    return fetchedObjects;
}

- (void)updateAPersonsContactInformation:(Person*)currentContact
{
    //make edits to someone currenttly in address book and make users updates equal to current person
    EditPersonViewController* editPersonVC = [[EditPersonViewController alloc] init];
    
    if (![editPersonVC.firstNameTextField.text isEqualToString:currentContact.firstName]) {
        currentContact.firstName = editPersonVC.firstNameTextField.text;
    }
    if (![editPersonVC.lastNameTextField.text isEqualToString:currentContact.lastName]) {
        currentContact.lastName = editPersonVC.lastNameTextField.text;
    }
    if (![editPersonVC.emailAddressTextField.text isEqualToString:currentContact.emailAddress]) {
        currentContact.emailAddress = editPersonVC.emailAddressTextField.text;
    }
    if (![editPersonVC.phoneNumberTextField.text isEqualToString:currentContact.phoneNumber]) {
        currentContact.phoneNumber = editPersonVC.phoneNumberTextField.text;
    }
}

//- (void)deletePersonFromAddressBook:(Person*)currentContact
//{
//    //delete a person from CoreData
//    [_managedObjectContext deleteObject:currentContact];
//    [self saveModifiedPersonToCoreData];
//    
//}

+ (void)saveModifiedPersonToCoreData
{
    //save a person to CoreData
    NSError* error;
    if (![[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext] save:&error]) {
        NSLog(@"failed to save error:%@", error.userInfo);
    }
}



@end
