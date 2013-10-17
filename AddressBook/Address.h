//
//  Address.h
//  AddressBook
//
//  Created by John Andrews on 10/17/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Address : NSManagedObject


@property (strong,nonatomic) NSString* homeStreetAddress;

@property (strong,nonatomic) NSString* homeCity;

@property (strong,nonatomic) NSString* homeState;

@property (strong,nonatomic) NSString* homeZipCode;

@property (strong,nonatomic) NSString* workStreetAddress;

@property (strong,nonatomic) NSString* workCity;

@property (strong,nonatomic) NSString* workState;

@property (strong,nonatomic) NSString* workZipCode;



@end
