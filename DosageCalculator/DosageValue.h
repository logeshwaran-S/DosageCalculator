//
//  DosageValue.h
//  DosageCalculator
//
//  Created by HSCITECH on 12/17/14.
//  Copyright (c) 2014 highland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DosageValue : UIViewController
{
    IBOutlet UILabel *txt_dosageval;
    IBOutlet UITextField *lbl_WeightConvn;
    IBOutlet UIButton *btn_WeightConvn;
    UITableViewCell *cell;
    IBOutlet UITableView *tbl_weightlist;
    
    int row;
    
    NSInteger selectedRow;
    NSString *StrAppLB;
    NSString *StrAppKG;
}

@property(nonatomic,strong)NSString *strdosageval;
@property(nonatomic,strong)NSMutableArray *arrWeight;

-(IBAction)WeightConversion:(id)sender;
-(IBAction)ReCalculate:(id)sender;
@end
