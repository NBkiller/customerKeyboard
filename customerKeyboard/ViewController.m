//
//  ViewController.m
//  customerKeyboard
//
//  Created by administrator on 16/8/15.
//  Copyright © 2016年 NB_killer. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+ZPNumberKeyboard.h"
#define HMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface ViewController ()
{
    UITextField *_moneyField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTextFiled];
}

- (void)initTextFiled
{
    _moneyField = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    _moneyField.font = [UIFont systemFontOfSize:15];
    _moneyField.layer.borderWidth = 1;
    //    _moneyField.secureTextEntry = YES;
    _moneyField.layer.borderColor = [UIColor redColor].CGColor;
    _moneyField.KeyBoardStyle = TextFiledKeyBoardStyleMoney;//要用到支付宝的数字键盘只需加上这句话就可以了
    [self.view addSubview:_moneyField];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end