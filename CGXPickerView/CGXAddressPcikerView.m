//
//  CGXAddressPcikerView.m
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2017/8/22.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXAddressPcikerView.h"

#import "CGXAddressModel.h"

@interface CGXAddressPcikerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSInteger rowOfProvince; // 保存省份对应的下标
    NSInteger rowOfCity;     // 保存市对应的下标
    NSInteger rowOfTown;     // 保存区对应的下标
}

// 时间选择器（默认大小: 320px × 216px）
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *addressModelArr;

// 默认选中的值（@[省索引, 市索引, 区索引]）
@property (nonatomic, strong) NSArray *defaultSelectedArr;
// 是否开启自动选择
@property (nonatomic, assign) BOOL isAutoSelect;
//中间文字说明
@property (nonatomic , strong) NSString *titleStr;
//选择器文件名称
@property (nonatomic , strong) NSString *fileName;

// 选中后的回调
@property (nonatomic, copy) CGXAddressResultBlock resultBlock;

@end


@implementation CGXAddressPcikerView

#pragma mark - 显示地址选择器
+ (void)showAddressPickerWithTitle:(NSString *)title
                           DefaultSelected:(NSArray *)defaultSelectedArr
                              IsAutoSelect:(BOOL)isAutoSelect
                           Manager:(CGXPickerViewManager *)manager
                               ResultBlock:(CGXAddressResultBlock)resultBlock
{
    CGXAddressPcikerView *addressPickerView = [[CGXAddressPcikerView alloc] initWithTitle:title DefaultSelected:defaultSelectedArr FileName:nil IsAutoSelect:isAutoSelect Manager:manager ResultBlock:resultBlock];
    [addressPickerView showWithAnimation:YES];
}
+ (void)showAddressPickerWithTitle:(NSString *)title
                   DefaultSelected:(NSArray *)defaultSelectedArr
                          FileName:(NSString *)fileName
                      IsAutoSelect:(BOOL)isAutoSelect
                           Manager:(CGXPickerViewManager *)manager
                       ResultBlock:(CGXAddressResultBlock)resultBlock
{
    CGXAddressPcikerView *addressPickerView = [[CGXAddressPcikerView alloc] initWithTitle:title DefaultSelected:defaultSelectedArr FileName:fileName IsAutoSelect:isAutoSelect Manager:manager ResultBlock:resultBlock];
    [addressPickerView showWithAnimation:YES];
}
#pragma mark - 初始化地址选择器
- (instancetype)initWithTitle:(NSString *)title
              DefaultSelected:(NSArray *)defaultSelectedArr
                     FileName:(NSString *)fileName
                 IsAutoSelect:(BOOL)isAutoSelect
                      Manager:(CGXPickerViewManager *)manager
                  ResultBlock:(CGXAddressResultBlock)resultBlock

{
    if (self = [super init]) {
        // 默认选中
        self.defaultSelectedArr = defaultSelectedArr;
        self.isAutoSelect = isAutoSelect;
        self.resultBlock = resultBlock;
        self.titleStr = title;
        self.fileName = fileName;
        if (manager) {
            self.manager = manager;
        }
        [self loadData];
        [self initUI];
    }
    return self;
}
-(NSString *)dataFilePath:(NSString *)nemeString{
    // 获取应用程序沙盒的Documents目录
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    // 也可以这样添加后缀，plistName是文件名
    NSString *plistName = [[NSString stringWithFormat:@"%@", nemeString] stringByAppendingPathExtension:@"plist"];
    // 得到完整的文件路径
    NSString *plistPath = [documentPath stringByAppendingPathComponent:plistName];
    return plistPath;
}
#pragma mark - 获地址数据
- (void)loadData {
    NSMutableArray *arrData = [NSMutableArray array];
    if (self.fileName) {
        if ([self.fileName hasSuffix:@".plist"]) {
            NSString *fileName = [self.fileName stringByReplacingOccurrencesOfString:@".plist" withString:@""];
            NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
            arrData = [NSMutableArray arrayWithContentsOfFile:filePath];
        } else if ([self.fileName hasSuffix:@".json"]){
            NSString *fileName = [self.fileName stringByReplacingOccurrencesOfString:@".json" withString:@""];
            NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
            NSData *JSONData = [NSData dataWithContentsOfFile:filePath];
            arrData = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
        }
        if ([self.fileName hasSuffix:@"--plist"]) {
            NSString  *str = [self.fileName stringByReplacingOccurrencesOfString:@".plist--plist" withString:@""];
            arrData = [NSMutableArray arrayWithContentsOfFile:[self dataFilePath:str]];
        }
    } else{
        NSString *strResourcesBundle = [[NSBundle mainBundle] pathForResource:@"CGXPickerView" ofType:@"bundle"];
        NSString *filePath = [[NSBundle bundleWithPath:strResourcesBundle] pathForResource:@"CGXAddressCity" ofType:@"plist"];
        arrData = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    for (NSDictionary *dict in arrData) {
        NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
        [dic1 setObject:[dict objectForKey:@"v"] forKey:@"name"];
        [dic1 setObject:[dict objectForKey:@"k"] forKey:@"code"];
        NSMutableArray *cityArr = [dict objectForKey:@"n"];
        NSMutableArray *aaaa = [NSMutableArray array];
        for (NSDictionary *dict in cityArr) {
            NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
            [dic2 setObject:[dict objectForKey:@"v"] forKey:@"name"];
            [dic2 setObject:[dict objectForKey:@"k"] forKey:@"code"];
            NSMutableArray *cityArr = [dict objectForKey:@"n"];
            NSMutableArray *bbbb = [NSMutableArray array];
            for (NSDictionary *dict in cityArr) {
                NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
                [dic3 setObject:[dict objectForKey:@"v"] forKey:@"name"];
                [dic3 setObject:[dict objectForKey:@"k"] forKey:@"code"];
                CGXTownModel *model3 = [CGXTownModel new];
                [model3 setValuesForKeysWithDictionary:dic3];
                [bbbb addObject:model3];
            }
            [dic2 setObject:bbbb forKey:@"town"];
            CGXCityModel *model2 = [CGXCityModel new];
            [model2 setValuesForKeysWithDictionary:dic2];
            [aaaa addObject:model2];
        }
        [dic1 setObject:aaaa forKey:@"city"];
        CGXProvinceModel *model1 = [CGXProvinceModel new];
        [model1 setValuesForKeysWithDictionary:dic1];
        [self.addressModelArr addObject:model1];
    }
}

#pragma mark - 初始化子视图
- (void)initUI {
    [super initUI];
    if (self.titleStr) {
        self.titleLabel.text = self.titleStr;
    } else{
        self.titleLabel.text = @"请选择城市";
    }
    // 添加时间选择器
    [self.alertView addSubview:self.pickerView];
}

#pragma mark - 背景视图的点击事件
- (void)didTapBackgroundView:(UITapGestureRecognizer *)sender {
    [self dismissWithAnimation:NO];
}

#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation {
    // 1.获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    if (animation) {
        // 动画前初始位置
        CGRect rect = self.alertView.frame;
        rect.origin.y = SCREEN_HEIGHT;
        self.alertView.frame = rect;
        
        // 浮现动画
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.alertView.frame;
            rect.origin.y -= self.manager.kTopViewH + self.manager.kPickerViewH;
            self.alertView.frame = rect;
        }];
    }

    NSInteger recordRowOfProvince=0;
    NSInteger recordRowOfCity = 0;
    NSInteger recordRowOfTown=0;

    if (self.defaultSelectedArr.count == 1) {
        recordRowOfProvince = [self.defaultSelectedArr[0] integerValue];
        // 2.滚动到默认行

    }
    if (self.defaultSelectedArr.count == 2) {
        recordRowOfProvince = [self.defaultSelectedArr[0] integerValue];
        recordRowOfCity = [self.defaultSelectedArr[1] integerValue];
    }
    if (self.defaultSelectedArr.count ==3) {
        recordRowOfProvince = [self.defaultSelectedArr[0] integerValue];
        recordRowOfCity = [self.defaultSelectedArr[1] integerValue];
        recordRowOfTown = [self.defaultSelectedArr[2] integerValue];
    }

    [self scrollToRow:recordRowOfProvince secondRow:recordRowOfCity thirdRow:recordRowOfTown];
}

#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation {
    // 关闭动画
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.alertView.frame;
        rect.origin.y += self.manager.kTopViewH + self.manager.kPickerViewH;
        self.alertView.frame = rect;
        self.backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.leftBtn removeFromSuperview];
        [self.rightBtn removeFromSuperview];
        [self.titleLabel removeFromSuperview];
        [self.lineView removeFromSuperview];
        [self.topView removeFromSuperview];
        [self.pickerView removeFromSuperview];
        [self.alertView removeFromSuperview];
        [self.backgroundView removeFromSuperview];
        [self removeFromSuperview];
        
        self.leftBtn = nil;
        self.rightBtn = nil;
        self.titleLabel = nil;
        self.lineView = nil;
        self.topView = nil;
        self.pickerView = nil;
        self.alertView = nil;
        self.backgroundView = nil;
    }];
}

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn {
    [self dismissWithAnimation:YES];
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn {
    NSLog(@"点击确定按钮后，执行block回调");
    [self dismissWithAnimation:YES];
    if(self.resultBlock) {
        NSArray *arr = [self getChooseCityArr];
        NSMutableArray *rowAry = [NSMutableArray array];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfProvince]];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfCity]];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfTown]];
        self.resultBlock(arr,rowAry);
    }
}

#pragma mark - 地址选择器
- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.manager.kTopViewH + 0.5, SCREEN_WIDTH, self.manager.kPickerViewH)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        _pickerView.showsSelectionIndicator = NO;
    }
    return _pickerView;
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.addressModelArr.count==0) {
        return 0;
    }
    return self.defaultSelectedArr.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    CGXProvinceModel *provinceModel = self.addressModelArr[rowOfProvince];
    CGXCityModel *cityModel = provinceModel.city[rowOfCity];
    if (component == 0) {
        //返回省个数
        return self.addressModelArr.count;
    }
    if (component == 1) {
        //返回市个数
        return provinceModel.city.count;
    }
    if (component == 2) {
        //返回区个数
        return cityModel.town.count;
    }
    return 0;
    
}

#pragma mark - PickerView的代理方法
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *showTitleValue = @"";
    if (component == 0) {//省
        CGXProvinceModel *provinceModel = self.addressModelArr[row];
        showTitleValue = provinceModel.name;
    }
    if (component == 1) {//市
        CGXProvinceModel *provinceModel = self.addressModelArr[rowOfProvince];
        CGXCityModel *cityModel = provinceModel.city[row];
        showTitleValue = cityModel.name;
    }
    if (component == 2) {//区
        CGXProvinceModel *provinceModel = self.addressModelArr[rowOfProvince];
        CGXCityModel *cityModel = provinceModel.city[rowOfCity];
        CGXTownModel *townModel = cityModel.town[row];
        showTitleValue = townModel.name;
    }
    return showTitleValue;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
        }
    }
    //可以通过自定义label达到自定义pickerview展示数据的方式
    UILabel* pickerLabel = (UILabel*)view;

    if (!pickerLabel)
    {
        pickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 30) / 3, self.manager.rowHeight)];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor whiteColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:self.manager.pickerTitleSize]];
        [pickerLabel setTextColor:self.manager.pickerTitleColor];
    }
    
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];//调用上一个委托方法，获得要展示的title
    return pickerLabel;
    
}
//设置单元格的高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return self.manager.rowHeight;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        rowOfProvince = row;
        rowOfCity = 0;
        rowOfTown = 0;
    } else if (component == 1) {
        rowOfCity = row;
        rowOfTown = 0;
    } else if (component == 2) {
        rowOfTown = row;
    }
    // 滚动到指定行
    [self scrollToRow:rowOfProvince secondRow:rowOfCity thirdRow:rowOfTown];
    
    // 自动获取数据，滚动完就回调
    if (self.isAutoSelect) {
        NSArray *arr = [self getChooseCityArr];
        
        NSMutableArray *rowAry = [NSMutableArray array];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfProvince]];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfCity]];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfTown]];

        if (self.resultBlock) {
            self.resultBlock(arr,rowAry);
        }
    }
}

#pragma mark - Tool
- (NSArray *)getChooseCityArr {
    NSArray *arr;
    if (rowOfProvince < self.addressModelArr.count) {
        CGXProvinceModel *provinceModel = self.addressModelArr[rowOfProvince];
            if (rowOfCity < provinceModel.city.count) {
                CGXCityModel *cityModel = provinceModel.city[rowOfCity];
                if (rowOfTown < cityModel.town.count) {
                    CGXTownModel *townModel = cityModel.town[rowOfTown];
                    arr = @[provinceModel.name, cityModel.name, townModel.name];
                }
            }
    }
    return arr;
}

#pragma mark - 滚动到指定行
- (void)scrollToRow:(NSInteger)firstRow secondRow:(NSInteger)secondRow thirdRow:(NSInteger)thirdRow {
    if (firstRow < self.addressModelArr.count) {
        rowOfProvince = firstRow;
        CGXProvinceModel *provinceModel = self.addressModelArr[firstRow];
        if (self.defaultSelectedArr.count == 2) {
            if (secondRow < provinceModel.city.count) {
                rowOfCity = secondRow;
                [self.pickerView reloadComponent:1];
            }
        }
        if (self.defaultSelectedArr.count == 3) {
            if (secondRow < provinceModel.city.count) {
                rowOfCity = secondRow;
                [self.pickerView reloadComponent:1];
                CGXCityModel *cityModel = provinceModel.city[secondRow];
                if (thirdRow < cityModel.town.count) {
                    rowOfTown = thirdRow;
                    [self.pickerView selectRow:firstRow inComponent:0 animated:YES];
                    [self.pickerView selectRow:secondRow inComponent:1 animated:YES];
                    [self.pickerView reloadComponent:2];
                    [self.pickerView selectRow:thirdRow inComponent:2 animated:YES];
                }
            }
        }
    }

    // 是否自动滚动回调
    if (/* DISABLES CODE */ (false)) {
        NSArray *arr = [self getChooseCityArr];
        NSMutableArray *rowAry = [NSMutableArray array];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfProvince]];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfCity]];
        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfTown]];
        if (self.resultBlock != nil) {
            self.resultBlock(arr,rowAry);
        }
    }
}

- (NSMutableArray *)addressModelArr {
    if (!_addressModelArr) {
        _addressModelArr = [[NSMutableArray alloc]init];
    }
    return _addressModelArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
