//
//  ActivationClass.h
//  DosageCalculator
//
//  Created by HSCITECH on 1/21/15.
//  Copyright (c) 2015 highland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivationClass : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *WebGmail;
    NSData *ResponseData;
}
-(IBAction)Activation:(id)sender;

@end
