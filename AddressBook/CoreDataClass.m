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
#import "Address.h"

@implementation CoreDataClass
{
    NSManagedObjectContext* _managedObjectContext;
}


//CRUDS
+ (void)createPersonForAddressBookWithFirstName:(NSString*)firstName
                                       LastName:(NSString*)lastName
                                    PhoneNumber:(NSString*)phoneNumber
                                   EmailAddress:(NSString*)emailAddress
                              HomeStreetAddress:(NSString*)homeStreetAddress
                                       HomeCity:(NSString*)homeCity
                                      HomeState:(NSString*)homeState
                                    HomeZipCode:(NSString*)homeZipCode
                              WorkStreetAddress:(NSString*)workStreetAddress
                                       WorkCity:(NSString*)workCity
                                      WorkState:(NSString*)workState
                                    WorkZipCode:(NSString*)workZipCode
{
    //make the text user enters (located in AddPersonViewController) equal to a new person
    Person* newContactPart1 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext]];
    
    Address* newContactPart2 = [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext]];
    
    newContactPart1.firstName = firstName;
    newContactPart1.lastName = lastName;
    newContactPart1.emailAddress = emailAddress;
    newContactPart1.phoneNumber = phoneNumber;
    
    newContactPart2.homeStreetAddress = homeStreetAddress;
    newContactPart2.homeCity = homeCity;
    newContactPart2.homeState = homeState;
    newContactPart2.homeZipCode = homeZipCode;
    newContactPart2.workStreetAddress = workStreetAddress;
    newContactPart2.workCity = workCity;
    newContactPart2.workState = workState;
    newContactPart2.workZipCode = workZipCode;
    
//    newContactPart1.addressHome = [NSMutableArray arrayWithObjects:@[newContactPart2.homeStreetAddress], @[newContactPart2.homeCity], @[newContactPart2.homeState], @[newContactPart2.homeZipCode], nil];
//    newContactPart1.addressWork = [NSMutableArray arrayWithObjects:@[newContactPart2.workStreetAddress], @[newContactPart2.workCity], @[newContactPart2.workState], @[newContactPart2.workZipCode], nil];
}

+ (NSArray*)fetchPeronsContactInformation
{
    //view the most up-to-date information about a person from CoreData
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
