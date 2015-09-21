//
//  DosageuserMatchlist.h
//  ConceptNote
//
//  Created by HSCITECH on 11/4/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DosageuserMatchlist : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITableView *tbl_ProductName;
    IBOutlet UITableView *tbl_Storage;
    IBOutlet UITableView *tbl_Moisture;
    IBOutlet UITableView *tbl_Temperature;
    IBOutlet UITableView *tbl_Humidity;
    
    IBOutlet UIScrollView *scrvew;
    IBOutlet UILabel *txt_dosageval;
    CGFloat   animatedDistance;
    
    int row;
    
    NSInteger selectedRow;
    NSString *StrApp0;
    NSString *StrApp;
    NSString *StrApp1;
    NSString *StrApp2;
    NSString *StrApp3;
    UITableViewCell *cell;
    NSInteger questionNo;
    NSMutableArray *tempArray;
    NSMutableArray *temp1Array;
    
    NSMutableArray *arr_replacedosVal;
    
    NSString *strdosageval;
    //change dosage
    NSInteger arrayCount;
    NSInteger Count;
    
}
@property(nonatomic,strong)NSMutableArray *arr_ProductName;
@property(nonatomic,strong)NSMutableArray *arr_storagecontent;
@property(nonatomic,strong)NSMutableArray *arr_moisturecontent;
@property(nonatomic,strong)NSMutableArray *arr_temperaturecontent;
@property(nonatomic,strong)NSMutableArray *arr_humiditycontent;

@property(nonatomic,strong)NSMutableArray *arr_DosageVal;
@property(nonatomic,strong)NSMutableArray *addarr_DosageVal;

//for changing dosage value

@property(nonatomic,strong)NSMutableArray *arrayOptionsAssigned;
@property(nonatomic,strong)NSMutableArray *dosagevallChange;
@property(nonatomic,retain)IBOutlet UITextField *txt_ProductName;
@property(nonatomic,retain)IBOutlet UITextField *txt_storageMatch;
@property(nonatomic,retain)IBOutlet UITextField *txt_moistureMatch;
@property(nonatomic,retain)IBOutlet UITextField *txt_temperatureMatch;
@property(nonatomic,retain)IBOutlet UITextField *txt_humidityMatch;

@property(nonatomic,strong)IBOutlet UITableView *tbl_Storage;
@property(nonatomic,strong)IBOutlet UITableView *tbl_Moisture;
@property(nonatomic,strong)IBOutlet UITableView *tbl_Temperature;
@property(nonatomic,strong)IBOutlet UITableView *tbl_Humidity;



@property(nonatomic,strong)NSMutableArray *arr_dosagecalContent;
@property(nonatomic,strong)NSMutableArray *arr_dosagecal;
//
@property(nonatomic,strong)NSMutableArray *tempArray;




-(IBAction)selectCategory1:(id)sender;
-(IBAction)selectCategory2:(id)sender;
-(IBAction)selectCategory3:(id)sender;
-(IBAction)selectCategory4:(id)sender;
-(IBAction)dosageVal:(id)sender;
-(IBAction)back:(id)sender;



@end
