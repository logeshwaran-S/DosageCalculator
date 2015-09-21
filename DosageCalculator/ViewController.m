//
//  ViewController.m
//  DosageCalculator
//
//  Created by HSCITECH on 12/9/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import "ViewController.h"
#import "DosageuserMatchlist.h"
#import "Registration.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.navigationController.navigationBarHidden=YES;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"DOSAGE.jpg"]];
    
    [self performSelector:@selector(NextView)
               withObject:nil afterDelay:5.0f];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)PresentDosageMatchlist
{
        
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    NSString *strEmail=[userDefaults objectForKey:@"ACTIVATEDEmail"];
    
    NSLog(@"string email =%@",strEmail);
       
    
   if (strEmail)
   {
       DosageuserMatchlist *dosageMatch=[self.storyboard instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
       [self presentViewController:dosageMatch animated:YES completion:Nil];

   }
   else
   {
       Registration *regis=[self.storyboard instantiateViewControllerWithIdentifier:@"Registration"];
       [self presentViewController:regis animated:YES completion:Nil];
    }
}
-(void)NextView {
    [self performSelectorOnMainThread:@selector(PresentDosageMatchlist) withObject:nil waitUntilDone:YES];
}

-(IBAction)DosageList:(id)sender
{
    DosageuserMatchlist *dosageMatch=[self.storyboard instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
    [self presentViewController:dosageMatch animated:YES completion:Nil];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
