//
//  CGXStringPickerView.h
//  CGXPickerView
//
//  Created by CGX on 2017/8/22.
//  Copyright © 2017年 CGX. All rights reserved.
//

#import "CGXPickerUIBaseView.h"
/**
 *  @param selectValue     选择的行标题文字
 *  @param selectRow       选择的行标题下标
 */
typedef void(^CGXStringResultBlock)(id selectValue,id selectRow);

@interface CGXStringPickerView : CGXPickerUIBaseView

/**
 *  显示自定义字符串选择器
 *
 *  @param title            标题
 *  @param dataSource       数组数据源
 *  @param defaultSelValue  默认选中的行(单列传字符串，多列传字符串数组)
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择后的回调
 *
 */
+ (void)showStringPickerWithTitle:(NSString *)title
                       DataSource:(NSArray *)dataSource
                  DefaultSelValue:(id)defaultSelValue
                     IsAutoSelect:(BOOL)isAutoSelect
                          Manager:(CGXPickerViewManager *)manager
                      ResultBlock:(CGXStringResultBlock)resultBlock;
/**
 *  显示自定义字符串选择器
 *
 *  @param title            标题
 *  @param fileName        fileName文件名
 *  @param defaultSelValue  默认选中的行(单列传字符串，多列传字符串数组)
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择后的回调
 *
 */
+ (void)showStringPickerWithTitle:(NSString *)title
                        FileName:(NSString *)fileName
                  DefaultSelValue:(id)defaultSelValue
                     IsAutoSelect:(BOOL)isAutoSelect
                          Manager:(CGXPickerViewManager *)manager
                      ResultBlock:(CGXStringResultBlock)resultBlock;
/**
// *  显示自定义字符串选择器   常规个人信息选项
// *
// *  @param title            标题
// *  @param defaultSelValue  默认选中的行(单列传字符串，多列传字符串数组)
// *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
// *  @param resultBlock      选择后的回调
//  *  @param style          样式选择
// *
// */
+ (void)showStringPickerWithTitle:(NSString *)title
                  DefaultSelValue:(id)defaultSelValue
                     IsAutoSelect:(BOOL)isAutoSelect
                          Manager:(CGXPickerViewManager *)manager
                      ResultBlock:(CGXStringResultBlock)resultBlock
                            Style:(NSInteger)style;

//***
//返回默认单行个人信息数组  如果使用了自定义 CGXPickerViewManager 属性 需要选择第二个
//***
//
+ (NSArray *)showStringPickerDataSourceStyle:(NSInteger)style;
+ (NSArray *)showStringPickerDataSourceStyle:(NSInteger)style Manager:(CGXPickerViewManager *)manager;

@end
