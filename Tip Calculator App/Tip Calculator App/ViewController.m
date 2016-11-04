//
//  ViewController.m
//  Tip Calculator App
//
//  Created by BridgeLabz Solutions LLP  on 10/28/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    NSString *textVal = [_billAmountText text];

    if ( textVal.length == 0)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You Missed Something !!!" message:@"You forgot to enter bill amount" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
                float amt = [textVal floatValue];
        float sliderval = [_slider value];
        float finalAmt = sliderval*amt;
        NSString *str = [[NSString alloc] initWithFormat:@"%1.2f",finalAmt];
        [_finalResult setText:str];

    }
   }

- (IBAction)sliderChanged:(id)sender
{
    NSString *slideValue = [[NSString alloc] initWithFormat:@"%1.2f%%",[_slider value]*100];
    [_tipPercent setText:slideValue];

}

@end
