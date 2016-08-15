# customerKeyboard
a keyboard imitate Alipay

 if you Choose customerKeyboard for your next project , you will found it usefull .
 How To Get Started:
 1. DownLoad customerKeyboard into your project
 2. #import "UITextField+ZPNumberKeyboard.h"
 
 You can use it like this:
 
    UITextField *moneyField; = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    moneyField.font = [UIFont systemFontOfSize:15];
    moneyField.layer.borderWidth = 1;
    //    moneyField.secureTextEntry = YES;
    moneyField.layer.borderColor = [UIColor redColor].CGColor;
    moneyField.KeyBoardStyle = TextFiledKeyBoardStyleMoney; //when you want to use ALipay ,you should choose the style
    [self.view addSubview:moneyField];

 Last, I had pod IQKeyboardManager ,so you will not to consider the hiden of the keyboard.
 
 Thanks very much ,if you find any bug , you can touch me with zhoupeng201004@sina.cn .  
 
 License
 customerKeyboard is released under the MIT license. See LICENSE for details.
