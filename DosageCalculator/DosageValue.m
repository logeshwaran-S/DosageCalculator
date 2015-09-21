//
//  DosageValue.m
//  DosageCalculator
//
//  Created by HSCITECH on 12/17/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import "DosageValue.h"
#import "AppDelegate.h"
#import "DosageuserMatchlist.h"

@interface DosageValue ()

@end

@implementation DosageValue
@synthesize strdosageval,arrWeight;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    NSLog(@"touchesBegan:withEvent:");
    
    tbl_weightlist.hidden=YES;    
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

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

    tbl_weightlist.hidden=YES;
   // lbl_WeightConvn.hidden=YES;
    self.navigationController.navigationBarHidden=YES;
    
    
    arrWeight=[[NSMutableArray alloc]initWithObjects:@"lbs/Ton",@"Kg/Tonne",nil];
    
   // AppDelegate *app = (AppDelegate *) [[UIApplication sharedApplication]delegate];
   // [txt_dosageval setEnabled:NO];
       
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    strdosageval=[userDefaults objectForKey:@"dosageVal"];
   
    NSLog(@"dosagearr =%@",strdosageval);
    
    txt_dosageval.text=strdosageval;
    

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrWeight count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"bg.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];  
    cell.textLabel.text=[arrWeight objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
        selectedRow = [indexPath row];
           
        StrAppLB =[NSString stringWithFormat:@"%@",[arrWeight objectAtIndex:0] ];
        StrAppKG =[NSString stringWithFormat:@"%@",[arrWeight objectAtIndex:1] ];
    
    
        
    if ([StrAppLB intValue] == selectedRow)
    {
        float weightKG=[strdosageval floatValue];
        float weightlbs=2.20462;
        
        float value= weightKG*weightlbs;
       // float finalresult=value*0.907185;
        
        NSString *strlblweight=[NSString stringWithFormat:@"%0.4f",value];
        
        txt_dosageval.text=strlblweight;
        lbl_WeightConvn.text=StrAppLB;

    }
    else
    {
        txt_dosageval.text=strdosageval;
        lbl_WeightConvn.text=StrAppKG;

    }
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        tbl_weightlist.hidden=YES;
}

-(IBAction)WeightConversion:(id)sender
{
    tbl_weightlist.hidden=NO;
    lbl_WeightConvn.hidden=NO;
}
-(IBAction)ReCalculate:(id)sender
{
    
    DosageuserMatchlist *dosagematch = [self.storyboard instantiateViewControllerWithIdentifier:@"DosageuserMatchlist"];
    [self presentViewController:dosagematch animated:YES completion:NULL];
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
