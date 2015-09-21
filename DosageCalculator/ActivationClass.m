//
//  ActivationClass.m
//  DosageCalculator
//
//  Created by HSCITECH on 1/21/15.
//  Copyright (c) 2015 highland. All rights reserved.
//

#import "ActivationClass.h"
#import "ViewController.h"
#import "Registration.h"
#import "AppDelegate.h"
#import "DosageuserMatchlist.h"

@interface ActivationClass ()

@end

@implementation ActivationClass

- (void)viewDidLoad
{
    
    float SystemVersion=[[[UIDevice currentDevice] systemVersion] floatValue];
    NSLog(@"%f System version",SystemVersion);
    
    if(SystemVersion <7.0f)
    {
        //Currently your app is running in IOS6 or older version. So you need not to do anything.
    }
    else
    {
        // Currently your app is running in IOS7. Do the following.
        
        CGRect TempRect;
        
        for(UIView *sub in [[self view] subviews])
        {
            if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
            {    // The iOS device = iPhone or iPod Touch
                
                
                CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
                
                
                // [sub setStatusBarStyle:UIStatusBarStyleLightContent];
                if (iOSDeviceScreenSize.height == 480)
                {
                    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgroud.png"]];
                    
                    TempRect=[sub frame];
                    
                    TempRect.origin.y+=0.0f; //Height of status bar
                    
                    [sub setFrame:TempRect];
                    
                }
                else if (iOSDeviceScreenSize.height == 568)
                {
                    
                    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgroud.png"]];
                    
                    
                    TempRect=[sub frame];
                    
                    TempRect.origin.y+=0.0f; //Height of status bar
                    
                    [sub setFrame:TempRect];
                }
                else if (iOSDeviceScreenSize.height == 667)
                {
                    
                    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgroud375*667.png"]];
                    
                    
                    TempRect=[sub frame];
                    
                    TempRect.origin.y+=0.0f; //Height of status bar
                    
                    [sub setFrame:TempRect];
                }
                
            }
        }
    }

    self.navigationController.navigationBarHidden=YES;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Activation:(id)sender
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    NSString *strEmail=[userDefaults objectForKey:@"UserEmail"];
    NSString *strudid=[userDefaults objectForKey:@"ActivationKey"];
    NSLog(@"EMAIL = %@",strEmail);
    NSLog(@"UDID = %@",strudid);
    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Activated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    alert.tag = 123;
//    [alert show];
    
    NSString *PostSingUp=[NSString stringWithFormat:@"email=%@&device=%@",strEmail,strudid];
    NSData *DataPostSingUp=[PostSingUp dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *LengthPostSingUp=[NSString stringWithFormat:@"%d",[DataPostSingUp length]];
    
    NSMutableURLRequest *RequestSingUp=[[NSMutableURLRequest alloc]init];
   //[RequestSingUp setURL:[NSURL URLWithString:@"http://www.hlscitech.com/dosage1/index.php/v1/user/verifyuser"]];
    [RequestSingUp setURL:[NSURL URLWithString:@"http://www.hlscitech.com/dosage/index.php/user/verifyuser"]];
    [RequestSingUp setHTTPMethod:@"Post"];
    [RequestSingUp setValue:LengthPostSingUp forHTTPHeaderField:@"Content-Length"];
    [RequestSingUp setHTTPBody:DataPostSingUp];
    
    //retriving values from webservice
    ResponseData = [NSURLConnection sendSynchronousRequest:RequestSingUp returningResponse:Nil error:Nil];
    //            if (ReturnData_reg)
    //            {
    
    //    NSMutableDictionary *DictionarySingUp=[ReturnSingUp JSONValue];
    NSDictionary *DictionarySingUp = [NSJSONSerialization
                                      JSONObjectWithData:ResponseData
                                      options:kNilOptions
                                      error:nil];
    NSLog(@"responese%@",DictionarySingUp);
    
    NSString *StatusSingUp = [NSString stringWithFormat:@"%@",[DictionarySingUp objectForKey:@"user_status"]];
    
    NSString *ErrorSingup = [NSString stringWithFormat:@"%@",[DictionarySingUp objectForKey:@"error"]];
    //   NSString *Userid = [NSString stringWithFormat:@"%@",[DictionarySingUp objectForKey:@"user_id"]];
    
    if ([StatusSingUp isEqualToString:@"1"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Activated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 123;
        [alert show];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults synchronize];
        [userDefaults setObject:strEmail forKey:@"ACTIVATEDEmail"];
        
        
    }
    else
        
    {
        UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Error" message:@"User is not yet registered / activated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        //alert1.tag = 1;
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==123)
    {
        
        DosageuserMatchlist *DosageMatch=[self.storyboard instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
        [self presentViewController:DosageMatch animated:YES completion:NULL];
        
    }
}
-(IBAction)Back:(id)sender
{
    Registration *regis=[self.storyboard instantiateViewControllerWithIdentifier:@"Registration"];
    [self presentViewController:regis animated:YES completion:NULL];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
