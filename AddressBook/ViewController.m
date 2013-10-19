//
//  ViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ShowPersonViewController.h"
#import "CoreDataClass.h"
#import "AppDelegate.h"
#import "AddPersonViewController.h"
#import "SWRevealViewController.h"


@interface ViewController ()

@end

@implementation ViewController
{    
    NSArray* addressBookContactsArray;
}

@synthesize people, indexOfSelectedPerson;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated]; //Required to run Apple's code for viewWillAppear 
    addressBookContactsArray = [CoreDataClass fetchPeronsContactInformation];
    [_tableView reloadData]; //reloads data into a table
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.people count]; old way
    
    //the number of rows will be the number of people in the array returned from CoreData
    
    return addressBookContactsArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identifier =@"abc";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    /*Person *personTemp =self.people[indexPath.row];
    cell.textLabel.text =  [NSString stringWithFormat:@" %@  %@", personTemp.firstName,personTemp.lastName ];
    return cell;
     old way */
    
    //need to fill cell with a contact's information from CoreData
    Person* tempPerson =[addressBookContactsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@" %@ %@", tempPerson.firstName, tempPerson.lastName];
    
    return cell;
}

- (IBAction)addPersonToAddressBookButton:(id)sender {
    
    [self performSegueWithIdentifier:@"VCtoAddVCSegue" sender:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexOfSelectedPerson = indexPath.row;
    [self performSegueWithIdentifier:@"ShowPerson" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"sender: %@", sender);

    if ([segue.identifier isEqualToString:@"ShowPerson"] || [segue.destinationViewController isKindOfClass: [ShowPersonViewController class]])
    {
        ShowPersonViewController *showPersonViewController = segue.destinationViewController;
        showPersonViewController.selectedPerson = [addressBookContactsArray objectAtIndex:indexOfSelectedPerson];
    }
    // configure the destination view controller:
    /*if ( [segue.destinationViewController isKindOfClass: [ShowPersonViewController class]] &&
        [sender isKindOfClass:[UITableViewCell class]] )
    {
        SWUITableViewCell* c = (SWUITableViewCell *)sender;
        ColorViewController* cvc = segue.destinationViewController;
        
        [cvc view];
        cvc.label.textColor = c.label.textColor;
        cvc.label.text = c.label.text;
    }*/
    
    // configure the segue.
    // in this case we dont swap out the front view controller, which is a UINavigationController.
    // but we could..
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
    {
        SWRevealViewControllerSegue* rvcs = (SWRevealViewControllerSegue*) segue;
        
        SWRevealViewController* rvc = self.revealViewController;
        NSAssert( rvc != nil, @"oops! must have a revealViewController" );
        
        NSAssert( [rvc.frontViewController isKindOfClass: [UINavigationController class]], @"oops!  for this segue we want a permanent navigation controller in the front!" );
        
        rvcs.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            //            UINavigationController* nc = (UINavigationController*)rvc.frontViewController;
            //            [nc setViewControllers: @[ dvc ] animated: NO ];
            //            [rvc setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
            UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:dvc];
            [rvc setFrontViewController:nc animated:YES];
        };
    }
}




/*
 - (UIViewController*)initWithCoder:(NSCoder*)aCoder
 {
 self = [super initWithCoder:aCoder];
 
 if (self) {
 people =[[NSMutableArray alloc]init];
 
 Person *p1 = [[Person alloc]init];
 
 p1.firstName =@"Jane";
 p1.lastName =@"Smith";
 p1.emailAddress = @"jane.smith@company.com";
 p1.phoneNumber=@"312-765-0987";
 
 
 Person *p2 = [[Person alloc]init];
 
 p2.firstName =@"Julio";
 p2.lastName =@"Juarez";
 p2.emailAddress = @"J.juarez@company.com";
 p2.phoneNumber=@"312-765-0988";
 
 
 Person *p3 = [[Person alloc]init];
 
 p3.firstName =@"Bill";
 p3.lastName =@"Frederickson";
 p3.emailAddress = @"b.frederickson@company.com";
 p3.phoneNumber=@"312-765-0989";
 
 Person *p4 = [[Person alloc]init];
 
 p4.firstName =@"Charles";
 p4.lastName =@"Xavier";
 p4.emailAddress = @"Charles.Xavier@company.com";
 p4.phoneNumber=@"312-765-0990";
 
 Person *p5 = [[Person alloc]init];
 
 p5.firstName =@"Timmy";
 p5.lastName =@"Jones";
 p5.emailAddress = @"t.jones@company.com";
 p5.phoneNumber=@"312-765-0991";
 
 
 [people addObject:p1];
 [people addObject:p2];
 [people addObject:p3];
 [people addObject:p4];
 [people addObject:p5];
 }
 return self;
 }
 */





@end
