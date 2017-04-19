//
//  ZHttpsRequest.m
//  仿朋友圈
//
//  Created by imac on 2017/2/21.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "ZHttpsRequest.h"
#import "AFNetworking.h"

@implementation ZHttpsRequest

static ZHttpsRequest *httpRequest = nil;
+(ZHttpsRequest *)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            
            httpRequest = [[ZHttpsRequest alloc]init];
            
        }
    });
    return httpRequest;
    
    
}

/**
 GET网络请求
 */
-(void)GetHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:Url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}



/**
 POST网络请求
 
 @param Url <#Url description#>
 
 */
-(void)PostHttpWithUrl:(NSString *)Url Parameters:(id)parameters sucess:(void(^)(id responseObject))sucess  failure:(void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:Url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        sucess(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}




@end
