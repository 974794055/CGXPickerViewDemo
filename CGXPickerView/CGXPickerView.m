//
//  CGXPickerView.m
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2017/8/23.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXPickerView.h"

#import "CGXStringPickerView.h"
#import "CGXDatePickerView.h"
#import "CGXAddressPcikerView.h"

@implementation CGXPickerView

+ (void)showStringPickerWithTitle:(NSString *)title
                         FileName:(NSString *)fileName
                  DefaultSelValue:(id)defaultSelValue
                     IsAutoSelect:(BOOL)isAutoSelect
                         Manager:(CGXPickerViewManager *)manager
                      ResultBlock:(CGXStringResultBlock)resultBlock
{
    [CGXStringPickerView showStringPickerWithTitle:title
                                          FileName:fileName
                                   DefaultSelValue:defaultSelValue
                                      IsAutoSelect:isAutoSelect
                                           Manager:(CGXPickerViewManager *)manager
                                       ResultBlock:^(id selectValue, id selectRow) {
        if (resultBlock) {
            resultBlock(selectValue,selectRow);
        } ;
    }];
    

}

+ (void)showStringPickerWithTitle:(NSString *)title
                       DataSource:(NSArray *)dataSource
                  DefaultSelValue:(id)defaultSelValue
                     IsAutoSelect:(BOOL)isAutoSelect
                          Manager:(CGXPickerViewManager *)manager
                      ResultBlock:(CGXStringResultBlock)resultBlock
{
    [CGXStringPickerView showStringPickerWithTitle:title
                                        DataSource:dataSource
                                   DefaultSelValue:defaultSelValue
                                      IsAutoSelect:isAutoSelect
                                           Manager:(CGXPickerViewManager *)manager
                                       ResultBlock:^(id selectValue, id selectRow) {
                                           if (resultBlock) {
                                               resultBlock(selectValue,selectRow);
                                           } ;
    }];
}

+ (void)showStringPickerWithTitle:(NSString *)title
                  DefaultSelValue:(id)defaultSelValue
                     IsAutoSelect:(BOOL)isAutoSelect
                         Manager:(CGXPickerViewManager *)manager
                      ResultBlock:(CGXStringResultBlock)resultBlock
                            Style:(CGXStringPickerViewStyle)style
{
    [CGXStringPickerView showStringPickerWithTitle:title
                                   DefaultSelValue:defaultSelValue
                                      IsAutoSelect:isAutoSelect
                                           Manager:(CGXPickerViewManager *)manager
                                       ResultBlock:^(id selectValue, id selectRow) {
                                           if (resultBlock) {
                                               resultBlock(selectValue,selectRow);
                                           } ;
    } Style:style];
}
+ (NSArray *)showStringPickerDataSourceStyle:(CGXStringPickerViewStyle)style
{
    NSArray *dataSource =[NSArray array];
    
    if (style == CGXStringPickerViewStyleEducation ||
        style == CGXStringPickerViewStyleBlood ||
        style == CGXStringPickerViewStyleAnimal ||
        style == CGXStringPickerViewStylConstellation ||
        style == CGXStringPickerViewStyleGender ||
        style == CGXStringPickerViewStylNation ||
        style == CGXStringPickerViewStylReligious ||
        style == CGXStringPickerViewStyleAge ||
        style == CGXStringPickerViewStylHeight ||
        style == CGXStringPickerViewStylWeight ||
        style == CGXStringPickerViewStylWeek) {
        dataSource  =[CGXStringPickerView showStringPickerDataSourceStyle:style];
    } else if (style == CGXStringPickerViewStyleAgeScope ||
               style == CGXStringPickerViewStylHeightScope ||
               style ==CGXStringPickerViewStylWeightScope){
        dataSource  =[[CGXStringPickerView showStringPickerDataSourceStyle:style] firstObject];
    }
    
    return dataSource;
}


+ (void)showDatePickerWithTitle:(NSString *)title
                       DateType:(UIDatePickerMode)type
                DefaultSelValue:(NSString *)defaultSelValue
                     MinDateStr:(NSString *)minDateStr
                     MaxDateStr:(NSString *)maxDateStr
                   IsAutoSelect:(BOOL)isAutoSelect
                        Manager:(CGXPickerViewManager *)manager
                    ResultBlock:(CGXDateResultBlock)resultBlock
{
    if (manager) {
        [CGXDatePickerView showDatePickerWithTitle:title
                                          DateType:type
                                   DefaultSelValue:defaultSelValue
                                        MinDateStr:minDateStr
                                        MaxDateStr:maxDateStr
                                      IsAutoSelect:isAutoSelect
                                       ResultBlock:^(NSString *selectValue) {
            if (resultBlock) {
                resultBlock(selectValue);
            }
        } Manager:manager];
    } else{
        [CGXDatePickerView showDatePickerWithTitle:title
                                          DateType:type
                                   DefaultSelValue:defaultSelValue
                                        MinDateStr:minDateStr
                                        MaxDateStr:maxDateStr
                                      IsAutoSelect:isAutoSelect
                                       ResultBlock:^(NSString *selectValue) {
            if (resultBlock) {
                resultBlock(selectValue);
            }
        }];
    }

}
+ (void)showAddressPickerWithTitle:(NSString *)title
                   DefaultSelected:(NSArray *)defaultSelectedArr
                      IsAutoSelect:(BOOL)isAutoSelect
                           Manager:(CGXPickerViewManager *)manager
                       ResultBlock:(CGXAddressResultBlock)resultBlock
{
    [CGXAddressPcikerView showAddressPickerWithTitle:title DefaultSelected:defaultSelectedArr IsAutoSelect:isAutoSelect Manager:manager ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
        if (resultBlock) {
            resultBlock(selectAddressArr,selectAddressRow);
        }; ;
    }];
}

+ (void)showAddressPickerWithTitle:(NSString *)title
                   DefaultSelected:(NSArray *)defaultSelectedArr
                          FileName:(NSString *)fileName
                      IsAutoSelect:(BOOL)isAutoSelect
                           Manager:(CGXPickerViewManager *)manager
                       ResultBlock:(CGXAddressResultBlock)resultBlock
{
    [CGXAddressPcikerView showAddressPickerWithTitle:title DefaultSelected:defaultSelectedArr FileName:fileName IsAutoSelect:isAutoSelect Manager:manager ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
        if (resultBlock) {
            resultBlock(selectAddressArr,selectAddressRow);
        }; ;
    }];
}

+ (NSString *)showSelectAddressProvince_id:(NSString *)province_id City_id:(NSString *)city_id
{
    NSString *mulStr = @"不限";
    NSMutableArray *arrData = [NSMutableArray array];
    NSString *strResourcesBundle = [[NSBundle mainBundle] pathForResource:@"CGXPickerView" ofType:@"bundle"];
    NSString *filePath = [[NSBundle bundleWithPath:strResourcesBundle] pathForResource:@"CGXAddressCity" ofType:@"plist"];
    arrData = [NSMutableArray arrayWithContentsOfFile:filePath];
    NSInteger inter1= [province_id integerValue];
    NSInteger inter2= [city_id integerValue];
    if (![province_id isEqualToString:@"0"]) {
        NSDictionary *dict1 = arrData[inter1];
        mulStr =[dict1 objectForKey:@"v"];
        NSArray *arr = [dict1 objectForKey:@"n"];
        if (![city_id isEqualToString:@"0"]) {
            NSDictionary *dict2 = arr[inter2];
            mulStr = [NSString stringWithFormat:@"%@-%@",mulStr,[dict2 objectForKey:@"v"]];
        }
    }
    return mulStr;
    
}

@end
