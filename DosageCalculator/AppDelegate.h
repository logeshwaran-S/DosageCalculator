//
//  AppDelegate.h
//  DosageCalculator
//
//  Created by HSCITECH on 12/9/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "DosageuserMatchlist.h"
#import "Registration.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *str_appendVal;
    int sizeHide;
    int sizeshow;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *str_appendVal;

@property(strong,nonatomic) NSString *str_Device;
@property(strong,nonatomic) NSString *str_DeviceUDID;
@property(strong,nonatomic) NSString *str_DeviceOS;
@property(strong,nonatomic) NSString *str_DeviceModel;
@property(strong,nonatomic) NSString *str_CarrierName;

@property(nonatomic,retain)NSString *typ_modal;



@end

