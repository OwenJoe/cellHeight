//
//  ViewController.m
//  News
//
//  Created by imac on 2017/3/29.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "ViewController.h"
#import "ZTableViewCell.h"

#import "ZHttpsRequest.h"
#import "Model.h"
#import "MJExtension.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *ZTableView;
@property (nonatomic,strong) NSMutableArray *listArry;
@property (nonatomic,strong) Model *model;
@property (nonatomic,strong) NSArray *arry;
@end

@implementation ViewController

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [NSMutableArray array];
    }
    return _listArry;
}



-(Model *)model{

    if (!_model) {
        _model =[[Model alloc]init];
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self AccessNetworkForDateMethod];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.ZTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.ZTableView.delegate = self;
    self.ZTableView.dataSource =self;
    [self.view addSubview:self.ZTableView];
    
#warning 打开自适应高度,默认值是NO
    self.ZTableView.fd_debugLogEnabled = YES;
    
    
#warning 注册Cell类,无论是纯代码的Cell,还是Xib的cell,否则会报错
    [self.ZTableView registerClass:[ZTableViewCell class] forCellReuseIdentifier:@"myCell"];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.listArry.count;
}


-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *iDs = @"myCell";
    ZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[ZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    //模型转换
    self.model = self.listArry[indexPath.row];
    cell.cellModel = self.model;
    

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
#warning 预缓存高度
    return [self.ZTableView fd_heightForCellWithIdentifier:@"myCell" cacheByKey:indexPath configuration:^(ZTableViewCell *cell) {
        
        cell.cellModel = self.listArry[indexPath.row];
        
    }];
    
    
   // [self.ZTableView fd_heightForCellWithIdentifier:@"myCell" cacheByKey:indexPath configuration:^(id cell) {
        
//    }];
}



/**
 网络请求
 */
-(void)AccessNetworkForDateMethod{
    
    
    
    NSString *urlStr =@"http://mappv5.caixin.com/index_page_v5/index_page_1.json?";
    
    [[ZHttpsRequest shareInstance]GetHttpWithUrl:urlStr Parameters:nil sucess:^(id responseObject) {
        
//        NSLog(@"打印结果:%@",responseObject);
        NSDictionary *dict = responseObject[@"data"];
        self.arry = dict[@"list"];
        
        //字典数组转模型数组
        NSArray *brry = [Model objectArrayWithKeyValuesArray:self.arry];
        
        //添加到数组
        [self.listArry addObjectsFromArray:brry];
        

        [self.ZTableView reloadData];
        
    } failure:^(NSError *error) {
        
         NSLog(@"打印结果:%@",error);
    }];
    
}


@end
