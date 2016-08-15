//
//  UITextField+ZPNumberKeyboard.h
//  WGZY
//
//  Created by administrator on 16/2/24.
//  Copyright © 2016年 zp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KeyBoardStyle) {
    TextFiledKeyBoardStyleMoney,
    TextFiledKeyBoardStyleNumber,
};

@interface UITextField (ZPNumberKeyboard)
@property(nonatomic,assign)NSInteger KeyBoardStyle;
@end
