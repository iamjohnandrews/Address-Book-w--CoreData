//
//  EditPersonViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "EditPersonViewController.h"

@interface EditPersonViewController ()


@end

@implementation EditPersonViewController

@synthesize editablePerson;


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
    
    _firstNameTextField.text = editablePerson.firstName;
    _lastNameTextField.text = editablePerson.lastName;
    _emailAddressTextField.text = editablePerson.emailAddress;
    _phoneNumberTextField.text = editablePerson.phoneNumber;
    
    
    
    
    
    
}

- (IBAction)savePersonUpdate:(id)sender {
    
    //transpose
    editablePerson.firstName = _firstNameTextField.text;
    editablePerson.lastName = _lastNameTextField.text;
    
    
    editablePerson.emailAddress = _emailAddressTextField.text ;
    editablePerson.phoneNumber = _phoneNumberTextField.text ;
    
    
    //navigates back to rootController featuring table
   // [self.navigationController popToRootViewControllerAnimated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
