//
//  ShowPersonViewController.h
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Address.h"

@interface ShowPersonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *emailAddressLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *homeStreetAddressLabel;

@property (weak, nonatomic) IBOutlet UILabel *homeCityLabel;

@property (weak, nonatomic) IBOutlet UILabel *homeStateLabel;

@property (weak, nonatomic) IBOutlet UILabel *homeZipCodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *workStreetAddressLabel;

@property (weak, nonatomic) IBOutlet UILabel *workCityLabel;

@property (weak, nonatomic) IBOutlet UILabel *workStateAddressLabel;

@property (weak, nonatomic) IBOutlet UILabel *workZipCodeLabel;

@property (weak, nonatomic) Person *selectedPerson;

@property (weak, nonatomic) Address *selectedPersonsAddress;

- (IBAction)navigateToEditPerson:(id)sender;



@end
