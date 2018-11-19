//
//  CGXAddressPcikerView.h
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2017/8/22.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXPickerUIBaseView.h"
/**
 *  @param selectAddressArr     选择的行标题文字
 *  @param selectAddressRow       选择的行标题下标
 */
typedef void(^CGXAddressResultBlock)(NSArray *selectAddressArr,NSArray *selectAddressRow);

@interface CGXAddressPcikerView : CGXPickerUIBaseView

/**
 *  显示地址选择器
 *
 *  @param defaultSelectedArr       默认选中的值(传数组，元素为对应的索引值。如：@[@10, @1, @1])
 *  @param isAutoSelect             是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock              选择后的回调
 *
 */
+ (void)showAddressPickerWithTitle:(NSString *)title
               DefaultSelected:(NSArray *)defaultSelectedArr
                                IsAutoSelect:(BOOL)isAutoSelect
                           Manager:(CGXPickerViewManager *)manager
                                 ResultBlock:(CGXAddressResultBlock)resultBlock;
/**
 *  显示地址选择器
 *
 *  @param defaultSelectedArr       默认选中的值(传数组，元素为对应的索引值。如：@[@10, @1, @1])
 *  @param isAutoSelect             是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock              选择后的回调
 
     支持  .plist文件   .json文件   目前最多支持三级联动
 
 格式 :   [@"k":@"哈哈",
          @"v":@"呜呜",
          @"n":[
               @"k":@"哈哈",
               @"v":@"呜呜",
               @"n":[{
                    @"k":@"哈哈",
                    @"v":@"呜呜"}]
               ]
          ]
*   @param fileName                 自定义多级选择器文件名称    代码plist文件需要穿xxx.plist--plist
 */
+ (void)showAddressPickerWithTitle:(NSString *)title
                   DefaultSelected:(NSArray *)defaultSelectedArr
                          FileName:(NSString *)fileName
                      IsAutoSelect:(BOOL)isAutoSelect
                           Manager:(CGXPickerViewManager *)manager
                       ResultBlock:(CGXAddressResultBlock)resultBlock;

@end
