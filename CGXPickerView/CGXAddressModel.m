//
//  CGXAddressModel.m
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2017/8/22.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXAddressModel.h"

@implementation CGXAddressModel

@end

@implementation CGXProvinceModel

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{
//             @"name": @"v",
//             @"city": @"n"
//             };
//}
//
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{
//             @"city": [CGXCityModel class]
//             };
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


@implementation CGXCityModel

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{
//             @"name": @"v",
//             @"town": @"n"
//             };
//}
//
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{
//             @"town": [CGXTownModel class]
//             };
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


@implementation CGXTownModel

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{
//             @"name": @"v"
//             };
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
