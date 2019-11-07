//
//  CGXAddressModel.h
//  CGXPickerView
//
//  Created by CGX on 2017/8/22.
//  Copyright © 2017年 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGXAddressModel : NSObject

@end

@class CGXProvinceModel, CGXCityModel, CGXTownModel;

@interface CGXProvinceModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *city;
@property (nonatomic, copy) NSString *code;

@end

@interface CGXCityModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *town;
@property (nonatomic, copy) NSString *code;

@end


@interface CGXTownModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;

@end

