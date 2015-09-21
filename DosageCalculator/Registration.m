//
//  Registration.m
//  DosageCalculator
//
//  Created by HSCITECH on 12/19/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import "Registration.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "ActivationClass.h"
#import "DosageuserMatchlist.h"
#import "Registration.h"

@interface Registration ()

@end

@implementation Registration

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

    arrEmail = [[NSMutableArray alloc]init];
    arrUDID=[[NSMutableArray alloc]init];
    self.navigationController.navigationBarHidden=YES;
    
    
//    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
//    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
//    if (networkStatus == NotReachable) {
//        NSLog(@"There IS NO internet connection");
//    } else {
//        
//        NSLog(@"There IS internet connection");
//        
//    }        
//}
  
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 140;
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
        
        
    }
    else
    {
        
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
        
    }
    
    return NO; // We do not want UITextField to insert line-breaks.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(IBAction)registeration:(id)sender
{
    
    AppDelegate *app= (AppDelegate *) [[UIApplication sharedApplication]delegate];
    NSLog(@"Device id:%@",app.str_DeviceUDID);   
    
    NSString *username=txt_Username.text;
    NSString *emailid= txt_email.text;
    NSString *phone=txt_Phonenumber.text;
    
//    [arrEmail addObject:emailid];
//    [arrUDID addObject:app.str_DeviceUDID];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    [userDefaults setObject:emailid forKey:@"UserEmail"];
    [userDefaults setObject:app.str_DeviceUDID forKey:@"UDID"];
    
    NSLog(@"Array EMAIL = %@",emailid);
    NSLog(@"Array UDID = %@",app.str_DeviceUDID);
    
    if ([txt_Username.text isEqualToString:@""]||[txt_email.text isEqualToString:@""]||[txt_Phonenumber.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert2 show];
        
    }
    else
    {
        NSString *PostSingUp =[NSString stringWithFormat:@"username=%@&email=%@&phone=%@&device=%@&OS=%@&model=%@",username,emailid,phone,app.str_DeviceUDID,app.str_DeviceOS,app.str_DeviceModel];
        
        NSData *DataPostSingUp=[PostSingUp dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *LengthPostSingUp=[NSString stringWithFormat:@"%d",[DataPostSingUp length]];
        
        NSMutableURLRequest *RequestSingUp=[[NSMutableURLRequest alloc]init];
        //[RequestSingUp setURL:[NSURL URLWithString:@"http://www.hlscitech.com/dosage1/index.php/v1/user/userSignup"]];
        
        [RequestSingUp setURL:[NSURL URLWithString:@"http://www.hlscitech.com/dosage/index.php/user/signup"]];
        [RequestSingUp setHTTPMethod:@"Post"];
        [RequestSingUp setValue:LengthPostSingUp forHTTPHeaderField:@"Content-Length"];
        [RequestSingUp setHTTPBody:DataPostSingUp];
        
        //retriving values from webservice
        ReturnData_reg = [NSURLConnection sendSynchronousRequest:RequestSingUp returningResponse:Nil error:Nil];
        //            if (ReturnData_reg)
        //            {
        
        //    NSMutableDictionary *DictionarySingUp=[ReturnSingUp JSONValue];
        NSDictionary *DictionarySingUp = [NSJSONSerialization JSONObjectWithData:ReturnData_reg options:kNilOptions error:nil];
        NSLog(@"responese%@",DictionarySingUp);
        
        NSString *StatusSingUp = [NSString stringWithFormat:@"%@",[DictionarySingUp objectForKey:@"status"]];
        
        NSString *ErrorSingup = [NSString stringWithFormat:@"%@",[DictionarySingUp objectForKey:@"error"]];
        
        
        NSString *ActivationKey = [NSString stringWithFormat:@"%@",[DictionarySingUp objectForKey:@"activationkey"]];
        NSLog(@"%@Activation key =",ActivationKey);
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults synchronize];
        [userDefaults setObject:ActivationKey forKey:@"ActivationKey"];
        
        
        
        if ([StatusSingUp isEqualToString:@"success"])
        {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Successfully Registered" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alert.tag = 1;
            [alert show];
            
            
        }
        else
            
        {
            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Phonenumber/email id exists" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            //alert1.tag = 1;
            
        }
        
    }

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==1)
    {
        
           ActivationClass *Actcntrllr=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivationClass"];
           [self presentViewController:Actcntrllr animated:YES completion:NULL];
        
    }
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
