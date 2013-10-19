//
//  MapViewController.m
//  AddressBook
//
//  Created by John Andrews on 10/19/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize revealButtonItem;

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
    
    [self.revealButtonItem setTarget: self.revealViewController];
    [self.revealButtonItem setAction: @selector( revealToggle: )];
    [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
}

@end
