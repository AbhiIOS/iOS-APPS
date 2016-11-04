//
//  ViewController.m
//  Photo Touch App
//
//  Created by ABHISHEK GANGULY on 11/4/16.
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

-(void)panGestureRecognized:(UIPanGestureRecognizer *)panGesture
{
    CGPoint point = [panGesture locationInView:[self view]];
    [[self view] bringSubviewToFront:[panGesture view]];
    [[panGesture view] setCenter:point];
}

-(void)tapGestureRecognized:(UITapGestureRecognizer *)tapGesture
{
    [[self view] bringSubviewToFront:[tapGesture view]];
    [UIView animateWithDuration:0.2 animations:^{
        
        [[tapGesture view] setBounds:CGRectMake(0, 0, 100, 100)];
    }completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [[tapGesture view] setBounds:CGRectMake(0, 0, 80, 80)];
        }];
    }];
}
- (IBAction)addButtonPressed:(id)sender {
    
    UIImagePickerController *imagepicker = [[UIImagePickerController alloc]init];
    [imagepicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagepicker setDelegate:self];
    
    [self presentViewController:imagepicker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *newImage = [[UIImageView alloc] initWithImage:image];
    [newImage setFrame:CGRectMake(-80, -80, 80, 80)];
    [newImage setUserInteractionEnabled:YES];
    
    UIPanGestureRecognizer *panGestureRecogniser = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    [newImage addGestureRecognizer:panGestureRecogniser];
    
    UITapGestureRecognizer *tapGestureRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [newImage addGestureRecognizer:tapGestureRecogniser];
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[self view] addSubview:newImage];
        
        [UIView animateWithDuration:0.2 animations:^{
            [newImage setFrame:CGRectMake(arc4random_uniform(240), arc4random_uniform(300), 80, 80)];
        }];
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
