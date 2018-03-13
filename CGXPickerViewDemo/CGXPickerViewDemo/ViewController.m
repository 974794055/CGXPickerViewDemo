//
//  ViewController.m
//  CGXPickerViewDemo
//
//  Created by 曹贵鑫 on 2018/1/31.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "ViewController.h"
#import "CGXPickerView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView reloadData];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @"出生年月选择器",
                      @"时间选择器",
                      @"日期和时间",
                      @"倒计时",
                      @"省,市,县",
                      @"省,市",
                      @"省",
                      @"自定义一行",
                      @"自定义二行",
                      @"教育",
                      @"血型",
                      @"星座",
                      @"生肖",
                      @"性别",
                      @"民族",
                      @"宗教",
                      @"身高",
                      @"身高范围",
                      @"体重",
                      @"体重范围",
                      @"年龄",
                      @"年龄范围",
                      @"星期",
                      nil];
    }
    return _dataArray;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView  =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 50;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *title =self.dataArray[indexPath.row];
    
    cell.textLabel.text = title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title =self.dataArray[indexPath.row];
    __weak typeof(self) weakSelf = self;
    if ([title isEqualToString:@"出生年月选择器"]) {
        NSDate *now = [NSDate date];
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *nowStr = [fmt stringFromDate:now];
        
        [CGXPickerView showDatePickerWithTitle:@"出生年月" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:@"1900-01-01 00:00:00" MaxDateStr:nowStr IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
            NSLog(@"%@",selectValue);
            weakSelf.navigationItem.title = selectValue;;
        }];
        
    }else if ([title isEqualToString:@"时间选择器"]){
        [CGXPickerView showDatePickerWithTitle:@"出生时刻" DateType:UIDatePickerModeTime DefaultSelValue:nil MinDateStr:nil MaxDateStr:nil IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
            NSLog(@"%@",selectValue);
            weakSelf.navigationItem.title = selectValue;;
        }];
    }else if ([title isEqualToString:@"日期和时间"]){
        [CGXPickerView showDatePickerWithTitle:@"日期和时间" DateType:UIDatePickerModeDateAndTime DefaultSelValue:nil MinDateStr:nil MaxDateStr:nil IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
            NSLog(@"%@",selectValue);
            weakSelf.navigationItem.title = selectValue;;
        }];
    }else if ([title isEqualToString:@"倒计时"]){
        [CGXPickerView showDatePickerWithTitle:@"倒计时" DateType:UIDatePickerModeCountDownTimer DefaultSelValue:nil MinDateStr:nil MaxDateStr:nil IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
            NSLog(@"%@",selectValue);
            weakSelf.navigationItem.title = selectValue;;
        }];
    }else if ([title isEqualToString:@"省,市,县"]){
        [CGXPickerView showAddressPickerWithTitle:@"请选择你的城市" DefaultSelected:@[@4, @0,@0] IsAutoSelect:YES Manager:nil ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
            NSLog(@"%@-%@",selectAddressArr,selectAddressRow);
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@%@%@", selectAddressArr[0], selectAddressArr[1],selectAddressArr[2]];;;;
        }];
    }else if ([title isEqualToString:@"省,市"]){
        [CGXPickerView showAddressPickerWithTitle:@"请选择你的城市" DefaultSelected:@[@0,@0] IsAutoSelect:YES Manager:nil ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
            NSLog(@"%@-%@",selectAddressArr,selectAddressRow);
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@%@", selectAddressArr[0], selectAddressArr[1]];
        }];
    }else if ([title isEqualToString:@"省"]){
        [CGXPickerView showAddressPickerWithTitle:@"请选择你的城市" DefaultSelected:@[@0] IsAutoSelect:YES Manager:nil ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
            NSLog(@"%@-%@",selectAddressArr,selectAddressRow);
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectAddressArr[0]];
        }];
    }
    else if ([title isEqualToString:@"自定义一行"]){
        [CGXPickerView showStringPickerWithTitle:@"红豆" DataSource:@[@"很好的", @"干干", @"高度", @"打的", @"都怪怪的", @"博对"] DefaultSelValue:@"高度" IsAutoSelect:NO Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue);
            weakSelf.navigationItem.title = selectValue;; ;
        }];
    }
    else if ([title isEqualToString:@"自定义二行"]){
        NSArray *dataSources = @[@[@"第1周", @"第2周", @"第3周", @"第4周", @"第5周", @"第6周", @"第7周"], @[@"第1天", @"第2天", @"第3天", @"第4天", @"第5天", @"第6天", @"第7天"]];
        NSArray *defaultSelValueArr = @[@"第3周"];
        [CGXPickerView showStringPickerWithTitle:@"学历" DataSource:dataSources DefaultSelValue:defaultSelValueArr IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@，%@", selectValue[0], selectValue[1]];
        }];
    }else if ([title isEqualToString:@"教育"]){
        
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleEducation] objectAtIndex:1];
        [CGXPickerView showStringPickerWithTitle:@"教育" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@--%@",selectValue,selectRow);
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStyleEducation];
    } else if ([title isEqualToString:@"血型"]){
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleBlood] objectAtIndex:1];
        [CGXPickerView showStringPickerWithTitle:@"血型" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStyleBlood];
    }   else if ([title isEqualToString:@"星座"]){
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylConstellation] objectAtIndex:1];
        [CGXPickerView showStringPickerWithTitle:@"星座" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylConstellation];
    }   else if ([title isEqualToString:@"生肖"]){
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleAnimal] objectAtIndex:1];
        [CGXPickerView showStringPickerWithTitle:@"生肖" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStyleAnimal];
    } else if ([title isEqualToString:@"性别"]){
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleGender] objectAtIndex:1];
        [CGXPickerView showStringPickerWithTitle:@"性别" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStyleGender];
    }else if ([title isEqualToString:@"民族"]){
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylNation] objectAtIndex:3];
        [CGXPickerView showStringPickerWithTitle:@"民族" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylNation];
    }else if ([title isEqualToString:@"宗教"]){
        
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylReligious] objectAtIndex:3];
        [CGXPickerView showStringPickerWithTitle:@"宗教" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylReligious];
    }else if ([title isEqualToString:@"身高"]){
        
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylHeight] objectAtIndex:3];
        [CGXPickerView showStringPickerWithTitle:@"身高" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylHeight];
    }else if ([title isEqualToString:@"身高范围"]){
        
        NSString *defaultSelValue1 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylHeightScope] objectAtIndex:3];
        
        NSString *defaultSelValue2 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylHeightScope] objectAtIndex:6];
        
        
        [CGXPickerView showStringPickerWithTitle:@"身高范围" DefaultSelValue:@[defaultSelValue1,defaultSelValue2] IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylHeightScope];
    }else if ([title isEqualToString:@"体重"]){
        
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylWeight] objectAtIndex:3];
        [CGXPickerView showStringPickerWithTitle:@"体重" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylWeight];
    }else if ([title isEqualToString:@"体重范围"]){
        
        NSString *defaultSelValue1 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylWeightScope] objectAtIndex:3];
        
        NSString *defaultSelValue2 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylWeightScope] objectAtIndex:6];
        
        [CGXPickerView showStringPickerWithTitle:@"体重范围" DefaultSelValue:@[defaultSelValue1,defaultSelValue2] IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylWeightScope];
    }else if ([title isEqualToString:@"年龄"]){
        
        NSString *defaultSelValue = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleAge] objectAtIndex:3];
        [CGXPickerView showStringPickerWithTitle:@"年龄" DefaultSelValue:defaultSelValue IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStyleAge];
    }else if ([title isEqualToString:@"年龄范围"]){
        
        NSString *defaultSelValue1 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleAgeScope] objectAtIndex:3];
        
        NSString *defaultSelValue2 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStyleAgeScope] objectAtIndex:6];
        
        [CGXPickerView showStringPickerWithTitle:@"年龄范围" DefaultSelValue:@[defaultSelValue1,defaultSelValue2] IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStyleAgeScope];
    }else if ([title isEqualToString:@"星期"]){
        
        NSString *defaultSelValue1 = [[CGXPickerView showStringPickerDataSourceStyle:CGXStringPickerViewStylWeek] objectAtIndex:3];
        [CGXPickerView showStringPickerWithTitle:@"星期" DefaultSelValue:defaultSelValue1 IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
            NSLog(@"%@",selectValue); ;
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectValue];
        } Style:CGXStringPickerViewStylWeek];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
