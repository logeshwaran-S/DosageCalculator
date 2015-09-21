//
//  Registration.h
//  DosageCalculator
//
//  Created by HSCITECH on 12/19/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CFNetwork/CFNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>


@interface Registration : UIViewController
{
    IBOutlet UITextField *txt_Username;
    IBOutlet UITextField *txt_Phonenumber;
    IBOutlet UITextField *txt_email;
   
    //IBOutlet UITextField *txt_userpassword;
    
    CGFloat   animatedDistance;
    
    NSData *ReturnData_reg;
    NSMutableArray *arrEmail;
    NSMutableArray *arrUDID;
}
-(IBAction)registeration:(id)sender;

@end
