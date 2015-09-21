//
//  DosageuserMatchlist.m
//  ConceptNote
//
//  Created by HSCITECH on 11/4/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import "DosageuserMatchlist.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "DosageValue.h"

@interface DosageuserMatchlist ()

@end

@implementation DosageuserMatchlist

@synthesize tbl_Temperature,tbl_Storage,tbl_Moisture,tbl_Humidity;
@synthesize txt_humidityMatch,txt_moistureMatch,txt_storageMatch,txt_temperatureMatch,txt_ProductName,arr_DosageVal;
@synthesize addarr_DosageVal,arr_dosagecal,arr_dosagecalContent,arr_ProductName;



@synthesize arr_humiditycontent,arr_moisturecontent,arr_storagecontent,arr_temperaturecontent,arrayOptionsAssigned;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"touchesBegan:withEvent:");
    
    tbl_ProductName.hidden=YES;
    tbl_Humidity.hidden=YES;
    tbl_Moisture.hidden=YES;
    tbl_Storage.hidden=YES;
    tbl_Temperature.hidden=YES;
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [scrvew setContentSize:CGSizeMake(320, 580)];
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
                    
                    [scrvew setScrollEnabled:YES];
                    [scrvew setContentSize:CGSizeMake(320,500)];
                    
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
    
    arrayOptionsAssigned=[[NSMutableArray alloc]init];
    arr_replacedosVal =[[NSMutableArray alloc]init];
    
    temp1Array=[[NSMutableArray alloc]init];
    tempArray=[[NSMutableArray alloc]init];
    addarr_DosageVal=[[NSMutableArray alloc]init];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    tbl_Storage.hidden=YES;
    tbl_Moisture.hidden=YES;
    tbl_Temperature.hidden=YES;
    tbl_Humidity.hidden=YES;
    tbl_ProductName.hidden=YES;
       
    
    StrApp = @"0";
    StrApp1 = @"0";
    StrApp2 = @"0";
    StrApp3 = @"0";
   
    
    arr_dosagecalContent=[[NSMutableArray alloc]init];
    arr_dosagecal=[[[NSMutableArray alloc]init]mutableCopy];
    
    //storage table
    arr_ProductName=[[NSMutableArray alloc]initWithObjects:@"Amonex Dry",@"Amonex Liquid",@"Amonex Active liquid",@"Amonex GT liquid",@"Fungiplex Dry", nil];
    
    arr_storagecontent=[[NSMutableArray alloc]initWithObjects:@"<4",@"5-8",@"9-12",@"13-16",@">16",nil];
    arr_moisturecontent=[[NSMutableArray alloc]initWithObjects:@"<10",@"<11-12",@"13-14",@">15" ,nil];
    arr_temperaturecontent=[[NSMutableArray alloc]initWithObjects:@"<25(77)",@"26-30(78.8-86)",@">30(86)", nil];
    arr_humiditycontent=[[NSMutableArray alloc]initWithObjects:@"<50%",@"50-75%",@">75%", nil];
    
    
    addarr_DosageVal=[[NSMutableArray alloc]initWithObjects:@"0",@"0",@"0",@"0",@"0.5",@"0.55",@"0.55",@"0.6",@"0.65",@"0.65",@"0.7",@"0.75",@"0.75",@"0.8",@"0.85",@"0.85",@"0.9",@"0.9",@"1.05",@"1.15",@"1.25",@"1.15",@"1.25",@"1.35",@"1.25",@"1.35",@"1.45",@"2.15",@"2.25",@"2.35",@"2.35",@"2.45",@"2.5",@"2.5",@"2.5",@"2.5",@"0.5",@"0.6",@"0.65",@"0.7",@"0.75",@"0.8",@"0.85",@"0.9",@"0.95",@"1",@"1.1",@"1.2",@"1.3",@"1.4",@"1.5",@"1.6",@"1.7",@"1.9",@"2.05",@"2.15",@"2.25",@"2.35",@"2.45",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"1.6",@"1.65",@"1.7",@"1.75",@"1.8",@"1.85",@"1.9",@"1.95",@"2",@"2.05",@"2.1",@"2.15",@"2.2",@"2.25",@"2.3",@"2.35",@"2.4",@"2.45",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"1.9",@"1.95",@"2",@"2.05",@"2.1",@"2.15",@"2.2",@"2.25",@"2.3",@"2.4",@"2.45",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.15",@"2.2",@"2.25",@"2.3",@"2.35",@"2.4",@"2.45",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",@"2.5",nil];
    
        arr_DosageVal=[[NSMutableArray alloc]init];
  
    
    
    int z=0;
    
    for (int i=0; i< [arr_storagecontent count]; i++)
    {
        
        for (int j=0; j< [arr_moisturecontent count]; j++)
            
        {
            for (int k=0; k< [arr_temperaturecontent count]; k++)
            {
                for (int l=0; l< [arr_humiditycontent count]; l++)
                    
                {
                    
                    z=z+1;
                    
                    
                    NSString *display = [[NSString stringWithFormat:@"%@,",[arr_storagecontent objectAtIndex:i]] stringByAppendingFormat:@"%@,%@,%@", [NSString stringWithFormat:@"%@",[arr_moisturecontent objectAtIndex:j] ],[NSString stringWithFormat:@"%@",[arr_temperaturecontent objectAtIndex:k]],[NSString stringWithFormat:@"%@",[arr_humiditycontent objectAtIndex:l]]];
                    
                    NSLog(@"display: %@",display);
                    
                    [arr_dosagecal addObject:display];
                    NSLog(@"display in array : %@",arr_dosagecal);
                    
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    [userDefaults setObject:arr_dosagecal forKey:@"arrDisplay"];
                    [userDefaults synchronize];
                    
                     NSLog(@"user default dosagecalculation: %@",[userDefaults objectForKey:@"arrDisplay"]);
                    NSLog(@"arr count= %d",z);
                    
                    
                                
        
   
                }
            }
        }
    }
    for (int a=0; a< [addarr_DosageVal count]; a++)
    {
        strdosageval=arr_dosagecal[Count];
        NSString *dosage_all = [strdosageval stringByAppendingFormat:@"=%@",[addarr_DosageVal objectAtIndex:a]];
        [arr_DosageVal addObject:dosage_all];
        NSLog(@"arrfull dosage val%@",arr_DosageVal);
        Count++;
    }
    
    [super viewDidLoad];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  
    
    Count=0;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    if (tableView.tag==10)
    {
        return [arr_ProductName count];
       // NSLog(@"arr_store:%@",arr_ProductName);
    }

	if (tableView.tag==11)
    {
        return [arr_storagecontent count];
       // NSLog(@"arr_store:%@",arr_storagecontent);
    }
    else if (tableView.tag==12)
    {
        return [arr_moisturecontent count];
       // NSLog(@"arr_moisture:%@",arr_moisturecontent);
    }
    else if (tableView.tag==13)
    {
        return [arr_temperaturecontent count];
       // NSLog(@"arr_temp:%@",arr_temperaturecontent);
    }
    else
    {
        return [arr_humiditycontent count];
       // NSLog(@"arr_humid:%@",arr_humiditycontent);
    }
	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"bg.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];  
    if (tableView.tag==10)
    {
        cell.textLabel.text=[arr_ProductName objectAtIndex:indexPath.row];
        
    }

    else if (tableView.tag==11)
    {
        cell.textLabel.text=[arr_storagecontent objectAtIndex:indexPath.row];
        
    }
    else if (tableView.tag==12)
    {
        cell.textLabel.text=[arr_moisturecontent objectAtIndex:indexPath.row];
    }
    else if (tableView.tag==13)
    {
        
        cell.textLabel.text=[arr_temperaturecontent objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text=[arr_humiditycontent objectAtIndex:indexPath.row];
    }
    
    
    row = [indexPath row];
    
    return cell;
	
}
-(IBAction)selectProductName:(id)sender
{
    
    tbl_ProductName.hidden=NO;
    tbl_Storage.hidden=YES;
    tbl_Moisture.hidden=YES;
    tbl_Humidity.hidden=YES;
    tbl_Temperature.hidden=YES;
}
-(IBAction)selectCategory1:(id)sender
{
    
    tbl_Storage.hidden=NO;
    tbl_ProductName.hidden=YES;
    tbl_Moisture.hidden=YES;
    tbl_Humidity.hidden=YES;
    tbl_Temperature.hidden=YES;
}
-(IBAction)selectCategory2:(id)sender
{
    
    tbl_Moisture.hidden=NO;
    tbl_Storage.hidden=YES;
    tbl_ProductName.hidden=YES;
    tbl_Humidity.hidden=YES;
    tbl_Temperature.hidden=YES;
}

-(IBAction)selectCategory3:(id)sender
{
    
    tbl_Temperature.hidden=NO;
    tbl_Moisture.hidden=YES;
    tbl_Storage.hidden=YES;
    tbl_ProductName.hidden=YES;
    tbl_Humidity.hidden=YES;
}
-(IBAction)selectCategory4:(id)sender
{
    
    tbl_Humidity.hidden=NO;
    tbl_Temperature.hidden=YES;
    tbl_Moisture.hidden=YES;
    tbl_Storage.hidden=YES;
    tbl_ProductName.hidden=YES;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    selectedRow = [indexPath row];
    
    if (tableView.tag==10)
    {
        
        StrApp0 =[NSString stringWithFormat:@"%@",[arr_ProductName objectAtIndex:indexPath.row] ];
        NSLog(@"strapp:%@",StrApp0);
        txt_ProductName.text=StrApp0;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        tbl_ProductName.hidden=YES;
    }

    else if (tableView.tag==11)
    {
        
        StrApp =[NSString stringWithFormat:@"%@",[arr_storagecontent objectAtIndex:indexPath.row] ];
        NSLog(@"strapp:%@",StrApp);
        txt_storageMatch.text=StrApp;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        tbl_Storage.hidden=YES;
    }
    else if (tableView.tag==12)
    {
        
        StrApp1 =[NSString stringWithFormat:@"%@",[arr_moisturecontent objectAtIndex:indexPath.row] ];
        NSLog(@"strapp1:%@",StrApp1);
        txt_moistureMatch.text=StrApp1;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        tbl_Moisture.hidden=YES;
        
    }
    else if (tableView.tag==13)
    {
        
        StrApp2 =[NSString stringWithFormat:@"%@",[arr_temperaturecontent objectAtIndex:indexPath.row]];
        NSLog(@"strapp2:%@",StrApp2);
        txt_temperatureMatch.text=StrApp2;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        tbl_Temperature.hidden=YES;
        
    }
    else
    {
        
        StrApp3 =[NSString stringWithFormat:@"%@", [arr_humiditycontent objectAtIndex:indexPath.row]];
        NSLog(@"strapp3:%@",StrApp3);
        txt_humidityMatch.text=StrApp3;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        tbl_Humidity.hidden=YES;
        
    }
    
    
}

-(IBAction)dosageVal:(id)sender
{
    if ([txt_ProductName.text isEqualToString:@""]||[txt_storageMatch.text isEqualToString:@""]||[txt_moistureMatch.text isEqualToString:@""]||[txt_temperatureMatch.text isEqualToString:@""]||[txt_humidityMatch.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Please select all the fields" message:@"" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
        [alert show];
        
    }
else
{
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    AppDelegate *app = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    txt_dosageval.hidden=NO;
    
    app.str_appendVal= [StrApp stringByAppendingFormat:@",%@,%@,%@",StrApp1 ,StrApp2 , StrApp3];
    
    NSLog(@"Selected atring in table %@",app.str_appendVal);
    
    [userDefaults setObject:app.str_appendVal forKey:@"strappendval"];
    
    txt_dosageval.text = @"0";
    for (int i=0; i<arr_DosageVal.count ; i++)
    {
        
        tempArray = [[arr_DosageVal objectAtIndex:i] componentsSeparatedByString:@"=" ];
        NSLog(@"nndnndddg : %@",tempArray);
        

        
       if([[tempArray objectAtIndex:0] isEqualToString:app.str_appendVal])
       {
         //  txt_dosageval.text = [tempArray objectAtIndex:1];
           NSString *strdosagevalue=[NSString stringWithFormat:@"%@",[tempArray objectAtIndex:1]];
           NSLog(@"dosgae final value : %@",strdosagevalue);
           
           NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
           [userDefaults synchronize];
           [userDefaults setObject:strdosagevalue forKey:@"dosageVal"];
           
           DosageValue *dosageResult = [self.storyboard instantiateViewControllerWithIdentifier:@"DosageValue"];
           [self presentViewController:dosageResult animated:YES completion:NULL];


           
       }
       
       
     
    }
    
    
    NSLog(@"arr_dosagecalContent :%@",txt_dosageval.text);
}

}

-(IBAction)clear:(id)sender
{
    
    txt_ProductName.text=@"";
    txt_moistureMatch.text=@"";
    txt_humidityMatch.text=@"";
    txt_storageMatch.text=@"";
    txt_temperatureMatch.text=@"";
    
    tbl_ProductName.hidden=YES;
    tbl_Humidity.hidden=YES;
    tbl_Moisture.hidden=YES;
    tbl_Storage.hidden=YES;
    tbl_Temperature.hidden=YES;
    
}
-(IBAction)VisitwebSite:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://www.bentoli.com/"];
    [[UIApplication sharedApplication] openURL:url];
}
//-(IBAction)EditDosageValue:(id)sender
//{
//    
//    NSLog(@" w/o dosage valu: %@",arr_dosageVal);
//    //  NSString  *strOptionsReceived=arr_dosagecalContent[0];
//    NSString *strappn=[StrApp stringByAppendingFormat:@",%@,%@,%@",StrApp1, StrApp2, StrApp3];
//    //arrayOptionsAssigned=[strOptionsReceived componentsSeparatedByString:@","];
//    
//    NSString *dosage_String = [strappn stringByAppendingFormat:@"=%@",txt_dosageval.text];
//    
//    NSLog(@"arr_text edit value:%@",dosage_String);
//    
//    for (int i=0; i<arr_dosageVal.count ; i++)
//    {
//        
//        temp1Array = [[arr_dosageVal objectAtIndex:i] componentsSeparatedByString:@"=" ];
//        NSLog(@"nndnndddg : %@",temp1Array);
//        
//        if([[temp1Array objectAtIndex:0] isEqualToString: strappn])
//        {
//            
//            [arr_dosageVal replaceObjectAtIndex:i withObject:dosage_String];
//            NSLog(@"arr_dosageval changed : %@",arr_dosageVal);
//            
//        }
//        
//    }
//    
//
//}
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
