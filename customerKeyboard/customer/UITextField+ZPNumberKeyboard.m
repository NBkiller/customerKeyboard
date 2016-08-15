//
//  UITextField+ZPNumberKeyboard.m
//  WGZY
//
//  Created by administrator on 16/2/24.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "UITextField+ZPNumberKeyboard.h"
#import "ZPNumberKeyboard.h"
@implementation UITextField (ZPNumberKeyboard)


- (void)setKeyBoardStyle:(NSInteger)KeyBoardStyle
{
    if(KeyBoardStyle == TextFiledKeyBoardStyleMoney)
    {
        ZPNumberKeyboard *zpNumberKb = [[ZPNumberKeyboard alloc] init];
        zpNumberKb.textFiled = self;
        self.inputView = zpNumberKb;
    }else if(KeyBoardStyle == TextFiledKeyBoardStyleNumber){
        self.keyboardType = UIKeyboardTypeNumberPad;
    }
}

- (NSInteger)KeyBoardStyle
{
    return 0;
}

@end
