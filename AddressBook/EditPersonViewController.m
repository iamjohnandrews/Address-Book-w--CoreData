//
//  EditPersonViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "EditPersonViewController.h"
#import "CoreDataClass.h"
#import "AppDelegate.h"

@interface EditPersonViewController ()


@end

@implementation EditPersonViewController

@synthesize editablePerson, firstNameTextField, lastNameTextField, emailAddressTextField, phoneNumberTextField, homeStreetAddressTextField, homeCityTextField, homeStateTextField, homeZipCodeTextField, workStreetAddressTextField, workCityTextField, workStateTextField, workZipCodeTextField, editablePersonsAddress;


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
    
    firstNameTextField.text = editablePerson.firstName;
    lastNameTextField.text = editablePerson.lastName;
    emailAddressTextField.text = editablePerson.emailAddress;
    phoneNumberTextField.text = editablePerson.phoneNumber;
    
    homeStreetAddressTextField.text = editablePersonsAddress.homeStreetAddress;
    homeCityTextField.text = editablePersonsAddress.homeCity;
    homeStateTextField.text = editablePersonsAddress.homeState;
    homeZipCodeTextField.text = editablePersonsAddress.homeZipCode;
    
    workStreetAddressTextField.text = editablePersonsAddress.workStreetAddress;
    workCityTextField.text = editablePersonsAddress.workCity;
    workStateTextField.text = editablePersonsAddress.workState;
    workZipCodeTextField.text = editablePersonsAddress.workZipCode;
}

- (IBAction)savePersonUpdate:(id)sender {
    
    editablePerson.firstName = firstNameTextField.text;
    editablePerson.lastName = lastNameTextField.text;
    editablePerson.emailAddress = emailAddressTextField.text ;
    editablePerson.phoneNumber = phoneNumberTextField.text ;
    
    editablePersonsAddress.homeStreetAddress = homeStreetAddressTextField.text;
    editablePersonsAddress.homeCity = homeCityTextField.text;
    editablePersonsAddress.homeState = homeStateTextField.text;
    editablePersonsAddress.homeZipCode = homeZipCodeTextField.text;
    
    editablePersonsAddress.workStreetAddress = workStreetAddressTextField.text;
    editablePersonsAddress.workCity = workCityTextField.text;
    editablePersonsAddress.workState = workStateTextField.text;
    editablePersonsAddress.workZipCode = workZipCodeTextField.text;

    [CoreDataClass saveModifiedPersonToCoreData];
}



@end
