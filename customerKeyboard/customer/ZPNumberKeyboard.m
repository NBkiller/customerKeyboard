//
//  ZPNumberKeyboard.m
//  WGZY
//
//  Created by administrator on 16/2/24.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZPNumberKeyboard.h"
#define HMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KScreen_Width   [UIScreen mainScreen].bounds.size.width
#define KScreen_Height  [UIScreen mainScreen].bounds.size.height
#define keyBoardHeight 50.0 //数字键的高度
#define maxLength  100000//限制最大长度

@implementation ZPNumberKeyboard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = HMColor(242, 242, 242);
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, keyBoardHeight *4);
        [self addLines];
        [self initCustomKeyborad];
    }
    return self;
}



- (void)addLines
{
    for (int i = 0; i <4; i ++) {
        UIView *HView = [[UIView alloc] init];
        HView.backgroundColor = HMColor(207, 207, 207);
        HView.frame = CGRectMake(0, i*keyBoardHeight, 3*KScreen_Width/4, 0.5);
        if (i==0) {
            HView.frame = CGRectMake(0, i*keyBoardHeight, KScreen_Width, 0.5);
        }
        [self addSubview:HView];
        
        UIView *VView = [[UIView alloc]init];
        VView.backgroundColor = HMColor(207, 207, 207);
        VView.frame = CGRectMake(i*KScreen_Width/4, 0, 0.5, keyBoardHeight*4);
        if (i==0) {
            VView.frame = CGRectMake(0, 0, 0, 0);
        }
        [self addSubview:VView];

    }
}


- (void)initCustomKeyborad
{
    for (int x = 0; x < 12; x++)
    {
        UIButton *NumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [NumBtn setFrame:CGRectMake( x%3*(KScreen_Width / 4),  x/3*keyBoardHeight , KScreen_Width / 4, keyBoardHeight)];
        
        
        if (x <= 9){
            //数字1~9  小数点
            [NumBtn setTag:(x + 1)];
            [NumBtn setTitle:[NSString stringWithFormat:@"%ld",NumBtn.tag] forState:UIControlStateNormal];
            if (x==9) {
            [NumBtn setTitle:[NSString stringWithFormat:@"."] forState:UIControlStateNormal];
            }
        }else if (x == 11){
            //退下键盘
            NumBtn.tag = x;
            [NumBtn setImage:[UIImage imageNamed:@"resign"] forState:UIControlStateNormal];

        }else if (x == 10){
            //数字0
            NumBtn.tag = 0;
            [NumBtn setTitle:[NSString stringWithFormat:@"%ld",NumBtn.tag] forState:UIControlStateNormal];
        }
        
        [NumBtn setBackgroundColor:[UIColor clearColor]];
        [NumBtn setTitleColor:HMColor(51, 51, 51) forState:UIControlStateNormal];
        NumBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        NumBtn.adjustsImageWhenHighlighted = TRUE;
        [NumBtn setBackgroundImage:[self createImageWithColor:HMColor(208, 208, 208)] forState:UIControlStateHighlighted];
        [NumBtn addTarget:self action:@selector(keyboardViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:NumBtn];
    }
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self initButton:deleteBtn withFrame:CGRectMake(3*KScreen_Width/4, 0, KScreen_Width/4, keyBoardHeight*2) backgroundColor:[UIColor clearColor] image:[UIImage imageNamed:@"delete"] backgroundImageOfColor:HMColor(208, 208, 208) font:0 title:@"" tag:12];
    
    UIButton *resignBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self initButton:resignBtn withFrame:CGRectMake(3*KScreen_Width/4, keyBoardHeight*2, KScreen_Width/4, keyBoardHeight*2) backgroundColor:HMColor(254, 194, 90) image:[UIImage imageNamed:@""] backgroundImageOfColor:HMColor(228, 174, 81) font:22 title:@"确定" tag:13];
}

- (void)initButton:(UIButton *)btn withFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image backgroundImageOfColor:(UIColor *)backgroundImageColor font:(NSInteger)font title:(NSString *)title tag:(NSInteger)tag
{
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:backgroundColor];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:[self createImageWithColor:backgroundImageColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setTitleColor:HMColor(51, 51, 51) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(keyboardViewAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = tag;
    [self addSubview:btn];
}

- (void)keyboardViewAction:(UIButton *)sender
{
    NSInteger tag = sender.tag;
//    NSLog(@"%ld",tag);
    switch (tag)
    {
        case 10:
        {
            // 小数点
            if(self.textFiled.text.length > 0 && [self.textFiled.text rangeOfString:@"." options:NSCaseInsensitiveSearch].location == NSNotFound && self.textFiled.text.length < maxLength)
                self.textFiled.text = [NSString stringWithFormat:@"%@.",self.textFiled.text];
        }
            break;
        case 11:
        {
            // 消失
            [self.textFiled resignFirstResponder];

        }
            break;
        case 12:
        {
            // 删除
            if(self.textFiled.text.length > 0)
                self.textFiled.text = [self.textFiled.text substringWithRange:NSMakeRange(0, self.textFiled.text.length - 1)];
        }
            break;
        case 13:
        {
            // 确认
            [self.textFiled resignFirstResponder];
        }
            break;
        default:
        {
            // 数字
            self.textFiled.text = [NSString stringWithFormat:@"%@%ld",self.textFiled.text,sender.tag];
            //开始输入0时，下一位不是小数点的处理
            NSString *numStr = [NSString stringWithFormat:@"0%ld",(long)sender.tag];
            if ([self.textFiled.text isEqualToString:numStr ]) {
                self.textFiled.text = [NSString stringWithFormat:@"%ld",(long)sender.tag];
            }
            if (self.textFiled.text.length > maxLength) {
                self.textFiled.text = [self.textFiled.text substringToIndex:maxLength];
            }

            
        }
            break;
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
