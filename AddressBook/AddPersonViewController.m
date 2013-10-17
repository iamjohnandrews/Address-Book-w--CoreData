//
//  AddPersonViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "AddPersonViewController.h"
#import "CoreDataClass.h"
#import "AppDelegate.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController

@synthesize firstNameTextField, lastNameTextField, emailAddressTextField, phoneNumberTextField, homeStreetAddressTextField, homeCityTextField, homeStateTextField, homeZipCodeTextField, workStreetAddressTextField, workCityTextField, workStateTextField, workZipCodeTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (IBAction)saveNewPerson:(id)sender
{
    //when user inputs text into text fields, its saved as person in CoreData
    [CoreDataClass createPersonForAddressBookWithFirstName:firstNameTextField.text
                                                  LastName:lastNameTextField.text
                                               PhoneNumber:phoneNumberTextField.text
                                              EmailAddress:emailAddressTextField.text
                                         HomeStreetAddress:homeStreetAddressTextField.text
                                                  HomeCity:homeCityTextField.text
                                                 HomeState:homeStateTextField.text
                                               HomeZipCode:homeZipCodeTextField.text
                                         WorkStreetAddress:workStreetAddressTextField.text
                                                  WorkCity:workCityTextField.text
                                                 WorkState:workStateTextField.text
                                               WorkZipCode:workZipCodeTextField.text];
    [CoreDataClass saveModifiedPersonToCoreData];
    
}
@end
