//
//  ShowPersonViewController.h
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ShowPersonViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;


@property (weak, nonatomic) IBOutlet UILabel *emailAddressLabel;


@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;


@property  (weak, nonatomic) Person *selectedPerson;


- (IBAction)navigateToEditPerson:(id)sender;


/* Replacing the proceeding with a Person
@property (weak,nonatomic) NSString * firstName;


@property (weak,nonatomic) NSString * lastName;

@property (weak,nonatomic) NSString * emailAddress;

@property (weak,nonatomic) NSString * phoneNumber;

*/

@end