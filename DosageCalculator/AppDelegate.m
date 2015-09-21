//
//  AppDelegate.m
//  DosageCalculator
//
//  Created by HSCITECH on 12/9/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import "AppDelegate.h"
#import "DosageuserMatchlist.h"
#import "Registration.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize str_appendVal;
@synthesize str_Device,str_DeviceOS,str_DeviceUDID,str_DeviceModel,str_CarrierName,window,typ_modal;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    

   [self initializeviewController];
    
//    self.window.rootViewController = self.Regis;
    //self.window.rootViewController = self.Dosage;
//    UIStoryboard *storyboard=[[UIStoryboard alloc]init];
//    [NSThread sleepForTimeInterval:1.0];
//    
//    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
    
    //UIViewController *VC = [storyboard instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
     //[self.window addSubview:VC.view];
    
    
    // Override point for customization after application launch.
    
    UIDevice *myDevice = [UIDevice currentDevice];
    
   // NSString *deviceUDID = myDevice.uniqueIdentifier;
    
    NSUUID *myDeviceudid = [NSUUID UUID];
    
    str_DeviceUDID = myDeviceudid.UUIDString;
    
     NSLog(@"My deviceUDID is: %@", str_DeviceUDID);
    
    
      str_Device = myDevice.name;
    
      NSLog(@"My deviceName is: %@", str_Device);
    
    
//    NSString *deviceSystemName = myDevice.systemName;
//     NSLog(@"My deviceSystemName is: %@", deviceSystemName);
    
      str_DeviceOS = myDevice.systemVersion;
      NSLog(@"My deviceOSVersion is: %@", str_DeviceOS);
    
      str_DeviceModel = myDevice.localizedModel;
      NSLog(@"My deviceModel is: %@", str_DeviceModel);
    
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    
    
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    
    
    str_CarrierName=[carrier carrierName];
    
    
    NSLog(@"Carrier Name: %@", str_CarrierName);
    
    
    NSLog(@"Mobile Country Code: %@", [carrier mobileCountryCode]);
    
    
    NSLog(@"Mobile Network Code: %@", [carrier mobileNetworkCode]);
    
    
    
    
    
    
    
    
    
    //if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        
    
    float SystemVersion=[[[UIDevice currentDevice] systemVersion] floatValue];
    
    NSLog(@"%f System version",SystemVersion);

    
    if(SystemVersion<8.4f && SystemVersion <8.3f && SystemVersion <8.2f && SystemVersion < 8.1f && SystemVersion <8.0f)

        
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
           }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         
         
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }


    
    
    
    
    
    
    
    
    
    
    return YES;
}
-(void)initializeviewController
{
   
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        
        
        // The iOS device = iPhone or iPod Touch
        
        
        CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
        
        // b=568;
        
        if (iOSDeviceScreenSize.height == 480)
            
        {
            
            // iPhone 3GS, 4, and 4S and iPod Touch 3rd and 4th generation: 3.5 inch screen (diagonally measured)
            
            // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone35
            
            
            UIStoryboard *iPhone4Storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
            
            typ_modal=@"Storyboard";
            
            // Instantiate the initial view controller object from the storyboard
            
            
            UIViewController *initialViewController = [iPhone4Storyboard instantiateInitialViewController];
            
            //a=480;
            
            sizeHide=480;
            
            sizeshow=430;
            
            // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
            
            
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults synchronize];
            
            NSString *strEmail=[userDefaults objectForKey:@"ACTIVATEDEmail"];
            
            NSLog(@"string email =%@",strEmail);
            
            if (strEmail)
                
             {
                
                //to initialize from appdelegate to view controller
                
                DosageuserMatchlist *controller = (DosageuserMatchlist*)[iPhone4Storyboard
                                                                         
                                                                         instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
            
            
                 
                self.window.backgroundColor=[UIColor whiteColor];
            
                [self.window setRootViewController:controller];
                 
                }
            
                else
            
                {
                    Registration *regis = (Registration*)[iPhone4Storyboard instantiateViewControllerWithIdentifier: @"Registration"];
            
                    [self.window setRootViewController:regis];
                   
                    
                }

            
//            // Set the initial view controller to be the root view controller of the window object
//            self.window.rootViewController  = initialViewController;
            
            
            // Set the window object to be the key window and show it
            [self.window makeKeyAndVisible];
        }
        
        if (iOSDeviceScreenSize.height == 568)
        {
            
            // iPhone 5 and iPod Touch 5th generation: 4 inch screen (diagonally measured)
            
            // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone4
            
            
            UIStoryboard *iPhone5Storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            
            typ_modal=@"Main";
            
            sizeHide=568;
            sizeshow=518;
            
            // Instantiate the initial view controller object from the storyboard
            UIViewController *initialViewController = [iPhone5Storyboard instantiateInitialViewController];
            
            // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults synchronize];
            
            NSString *strEmail=[userDefaults objectForKey:@"ACTIVATEDEmail"];
            
            NSLog(@"string email =%@",strEmail);
            
            if (strEmail)
                
            {
                
                //to initialize from appdelegate to view controller
                
                DosageuserMatchlist *controller = (DosageuserMatchlist*)[iPhone5Storyboard
                                                                instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
                
                
                
                self.window.backgroundColor=[UIColor whiteColor];
                
                [self.window setRootViewController:controller];
                
            }
            
            else
                
            {
                Registration *regis = (Registration*)[iPhone5Storyboard instantiateViewControllerWithIdentifier: @"Registration"];
                
                [self.window setRootViewController:regis];
                
                
            }
            

            // Set the initial view controller to be the root view controller of the window object
            //self.window.rootViewController  = initialViewController;
            
            // Set the window object to be the key window and show it
            [self.window makeKeyAndVisible];
        }
        
        if (iOSDeviceScreenSize.height == 667)
        {
            
            // iPhone 5 and iPod Touch 5th generation: 4 inch screen (diagonally measured)
            
            // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone4
            UIStoryboard *iPhone6Storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            typ_modal=@"MainStoryboard";
            
            
            // Instantiate the initial view controller object from the storyboard
            UIViewController *initialViewController = [iPhone6Storyboard instantiateInitialViewController];
            
            // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults synchronize];
            
            NSString *strEmail=[userDefaults objectForKey:@"ACTIVATEDEmail"];
            
            NSLog(@"string email =%@",strEmail);
            
            if (strEmail)
                
            {
                
                //to initialize from appdelegate to view controller
                
                DosageuserMatchlist *controller = (DosageuserMatchlist*)[iPhone6Storyboard
                                                                         instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
                
                
                
                self.window.backgroundColor=[UIColor whiteColor];
                
                [self.window setRootViewController:controller];
                
            }
            
            else
                
            {
                Registration *regis = (Registration*)[iPhone6Storyboard instantiateViewControllerWithIdentifier: @"Registration"];
                
                [self.window setRootViewController:regis];
                
                
            }
            
            
            // Set the initial view controller to be the root view controller of the window object
            //self.window.rootViewController  = initialViewController;
            
            // Set the window object to be the key window and show it
            [self.window makeKeyAndVisible];
        }
       

    }
}

//-(void)application:(UIApplication *)application registerUserNotificationSettings:(NSData *)deviceToken
//{
//   
////        NSLog(@"APN device token: %@", deviceToken);
////        NSString *deviceTokenString = [NSString stringWithFormat:@"%@",deviceToken];
//    
//    NSString *DeviceToken = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    DeviceToken = [DeviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"My token is: %@", DeviceToken);
//
//    
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
