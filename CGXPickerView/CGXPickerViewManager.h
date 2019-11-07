//
//  CGXPickerViewManager.h
//  CGXPickerView
//
//  Created by CGX on 2018/1/8.
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <UIKit/UIKit.h>
@interface CGXPickerViewManager : NSObject

@property (nonatomic , assign) CGFloat kPickerViewH;//选择器高度 默认200
@property (nonatomic , assign) CGFloat kTopViewH;//按钮高度 默认 50

@property (nonatomic , strong) UIColor *pickerTitleColor;//字体颜色  默认黑色
@property (nonatomic , assign) CGFloat pickerTitleSize;//字体大小  默认15

@property (nonatomic , strong) UIColor *pickerTitleSelectColor;//字体颜色  默认黑色
@property (nonatomic , assign) CGFloat pickerTitleSelectSize;//字体大小  默认15

@property (nonatomic , strong) UIColor *lineViewColor;//分割线颜色
@property (nonatomic , strong) UIColor *titleLabelColor;//中间标题颜色
@property (nonatomic , strong) UIColor *titleLabelBGColor;//中间标题背景颜色
@property (nonatomic , assign) CGFloat titleSize;//字体大小
@property (nonatomic , assign) CGFloat rowHeight; //单元格高度 默认50



@property (nonatomic , strong) UIColor *rightBtnTitleColor;//右侧标题颜色
@property (nonatomic , strong) UIColor *rightBtnBGColor;//右侧标题背景颜色
@property (nonatomic , assign) CGFloat rightBtnTitleSize;//字体大小
@property (nonatomic , strong) NSString *rightBtnTitle;//右侧文字
@property (nonatomic , assign) CGFloat rightBtnCornerRadius;//右侧圆角
@property (nonatomic , assign) CGFloat rightBtnBorderWidth;//右侧边框宽
@property (nonatomic , strong) UIColor *rightBtnborderColor;//右侧边框颜色


@property (nonatomic , strong) UIColor *leftBtnTitleColor;//右侧标题颜色
@property (nonatomic , strong) UIColor *leftBtnBGColor;//右侧标题背景颜色
@property (nonatomic , assign) CGFloat leftBtnTitleSize;//字体大小
@property (nonatomic , strong) NSString *leftBtnTitle;//右侧文字
@property (nonatomic , assign) CGFloat leftBtnCornerRadius;//右侧圆角
@property (nonatomic , assign) CGFloat leftBtnBorderWidth;//右侧边框宽
@property (nonatomic , strong) UIColor *leftBtnborderColor;//右侧边框颜色


@property (nonatomic , assign) BOOL isHaveLimit; //是否有 “不限”选项  默认没有

@end
