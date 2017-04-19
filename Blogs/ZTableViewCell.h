//
//  ZTableViewCell.h
//  News
//
//  Created by imac on 2017/3/29.
//  Copyright © 2017年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"


@interface ZTableViewCell : UITableViewCell

@property (nonatomic,strong) Model *cellModel;

@property (nonatomic,strong) UIImageView *iconImgView;
@property (nonatomic,strong) UILabel *sumLab;
@property (nonatomic,strong) UIImageView *picImgView;

@end
