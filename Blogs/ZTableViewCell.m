//
//  ZTableViewCell.m
//  News
//
//  Created by imac on 2017/3/29.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "ZTableViewCell.h"
#import "Masonry.h"


@implementation ZTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self initCell];
    }
    return self;
}



-(void)initCell{

    self.sumLab = [[UILabel alloc]init];
    
#warning 所有的控件都是放置在"self.contentView"
    [self.contentView addSubview:self.sumLab];
    
    self.sumLab.text =@"测试阶段";
#warning Lable行数限制设为0
    self.sumLab.numberOfLines = 0;
    
#warning 使用Masonry设置高度大小位置,无论如何,基于Bottom这个点是不能忽略的,位置也都是基于self.contentView
    [self.sumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView.mas_top).offset(5);
        make.left.mas_equalTo(self.contentView.mas_left).offset(5);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);

    }];

}


-(void)setCellModel:(Model *)cellModel{

    _cellModel = cellModel;
    self.sumLab.text = _cellModel.summary;
}




@end
