//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Janusz Chudzynski on 1/26/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)convert:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.resultLabel.text = @"Hello";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender {
    NSString * string = self.userInput.text;
    float userValue = string.floatValue;
    //calculations
    float userResult = userValue * 10/50.0 + 23;
    NSString * result = [NSString stringWithFormat:@"%f",userResult];
    self.resultLabel.text = result;
}
@end
