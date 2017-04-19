//
//  ZHttpsRequest.h
//  仿朋友圈
//
//  Created by imac on 2017/2/21.
//  Copyright © 2017年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHttpsRequest : NSObject

+(ZHttpsRequest *)shareInstance;
-(void)GetHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;
-(void)PostHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure;

@end
