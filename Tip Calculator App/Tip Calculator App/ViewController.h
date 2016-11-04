//
//  ViewController.h
//  Tip Calculator App
//
//  Created by BridgeLabz Solutions LLP  on 10/28/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmountText;

@property (weak, nonatomic) IBOutlet UILabel *tipPercent;
@property (weak, nonatomic) IBOutlet UILabel *finalResult;
@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)sliderChanged:(id)sender;

@end

