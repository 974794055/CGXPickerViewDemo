//
//  CGXPickerViewManager.m
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2018/1/8.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXPickerViewManager.h"

/// RGB颜色(16进制)
#define CGXPickerRGBColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];


@interface CGXPickerViewManager ()

@end
@implementation CGXPickerViewManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _kPickerViewH = 200;
        _kTopViewH = 50;
        _pickerTitleSize  =15;
        _pickerTitleColor = [UIColor blackColor];
        _lineViewColor =CGXPickerRGBColor(225, 225, 225, 1);
        
        _titleLabelColor = CGXPickerRGBColor(252, 96, 134, 1);
        _titleSize = 16;
        _titleLabelBGColor = [UIColor whiteColor];
        _rowHeight = 50;
        _rightBtnTitle = @"确定";
        _rightBtnBGColor =  CGXPickerRGBColor(252, 96, 134, 1);
        _rightBtnTitleSize = 16;
        _rightBtnTitleColor = [UIColor whiteColor];
        
        _rightBtnborderColor = CGXPickerRGBColor(252, 96, 134, 1);
        _rightBtnCornerRadius = 6;
        _rightBtnBorderWidth = 1;
        
        _leftBtnTitle = @"取消";
        _leftBtnBGColor =  CGXPickerRGBColor(252, 96, 134, 1);
        _leftBtnTitleSize = 16;
        _leftBtnTitleColor = [UIColor whiteColor];
        
        _leftBtnborderColor = CGXPickerRGBColor(252, 96, 134, 1);
        _leftBtnCornerRadius = 6;
        _leftBtnBorderWidth = 1;
        
    }
    return self;
}
@end
