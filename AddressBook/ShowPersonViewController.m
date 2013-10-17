//
//  ShowPersonViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "ShowPersonViewController.h"
#import "EditPersonViewController.h"
@interface ShowPersonViewController ()

@end

@implementation ShowPersonViewController
@synthesize selectedPerson, firstNameLabel, lastNameLabel, emailAddressLabel, phoneNumberLabel, homeCityLabel, homeStateLabel, homeStreetAddressLabel, homeZipCodeLabel, workCityLabel, workStateAddressLabel, workStreetAddressLabel, workZipCodeLabel, selectedPersonsAddress;

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
    
    firstNameLabel.text = selectedPerson.firstName;
    lastNameLabel.text= selectedPerson.lastName;
    emailAddressLabel.text = selectedPerson.emailAddress;
    phoneNumberLabel.text = selectedPerson.phoneNumber;
    
    homeStreetAddressLabel.text = selectedPersonsAddress.homeStreetAddress;
    homeCityLabel.text = selectedPersonsAddress.homeCity;
    homeStateLabel.text = selectedPersonsAddress.homeState;
    homeZipCodeLabel.text = selectedPersonsAddress.homeZipCode;
    
    workStateAddressLabel.text = selectedPersonsAddress.workStreetAddress;
    workCityLabel.text = selectedPersonsAddress.workCity;
    workStateAddressLabel.text = selectedPersonsAddress.workState;
    workZipCodeLabel.text = selectedPersonsAddress.workZipCode;
}

- (void)viewWillAppear:(BOOL)animated
{
    firstNameLabel.text = selectedPerson.firstName;
    lastNameLabel.text= selectedPerson.lastName;
    emailAddressLabel.text = selectedPerson.emailAddress;
    phoneNumberLabel.text = selectedPerson.phoneNumber;
    
    homeStreetAddressLabel.text = selectedPersonsAddress.homeStreetAddress;
    homeCityLabel.text = selectedPersonsAddress.homeCity;
    homeStateLabel.text = selectedPersonsAddress.homeState;
    homeZipCodeLabel.text = selectedPersonsAddress.homeZipCode;
    
    workStateAddressLabel.text = selectedPersonsAddress.workStreetAddress;
    workCityLabel.text = selectedPersonsAddress.workCity;
    workStateAddressLabel.text = selectedPersonsAddress.workState;
    workZipCodeLabel.text = selectedPersonsAddress.workZipCode;
}


- (IBAction)navigateToEditPerson:(id)sender {
    
    [self performSegueWithIdentifier:@"EditPerson" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    EditPersonViewController *editPersonViewController = segue.destinationViewController;
    
    [editPersonViewController setEditablePerson:selectedPerson ];
}



@end
