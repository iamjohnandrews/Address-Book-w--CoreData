//
//  EditPersonViewController.h
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Address.h"

@interface EditPersonViewController : UIViewController

@property (weak, nonatomic) Person *editablePerson;

@property (weak, nonatomic) Address *editablePersonsAddress;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *homeStreetAddressTextField;

@property (weak, nonatomic) IBOutlet UITextField *homeCityTextField;

@property (weak, nonatomic) IBOutlet UITextField *homeStateTextField;

@property (weak, nonatomic) IBOutlet UITextField *homeZipCodeTextField;

@property (weak, nonatomic) IBOutlet UITextField *workStreetAddressTextField;

@property (weak, nonatomic) IBOutlet UITextField *workCityTextField;

@property (weak, nonatomic) IBOutlet UITextField *workStateTextField;

@property (weak, nonatomic) IBOutlet UITextField *workZipCodeTextField;
@end
