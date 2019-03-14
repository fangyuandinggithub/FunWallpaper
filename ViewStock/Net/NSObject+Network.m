//
//  NSObject+Network.m
//  BaseProject
//
//  Created by 牛犇 on 15/12/16.
//  Copyright © 2015年 shangmenle. All rights reserved.
//

#import "NSObject+Network.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "SMLProgressView.h"
#import "NSObject+HUD.h"
#import "Define.h"
@implementation NSObject (Network)

+ (AFHTTPSessionManager *)sharedAFManager{
    static AFHTTPSessionManager *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval=60;
        //在上文的单例中添加安全策略，及允许无效证书访问
        AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        [security setValidatesDomainName:NO];
        
        security.allowInvalidCertificates = YES;
        
        manager.securityPolicy = security;
        
     
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
//        [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
    });
    return manager;
}


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    
    AFHTTPSessionManager *manager = [self sharedAFManager];
    manager.requestSerializer.timeoutInterval = 60;
    if([MyDefaults objectForKey:@"webtoken"]){
        [manager.requestSerializer  setValue:[MyDefaults objectForKey:@"webtoken"]
                          forHTTPHeaderField:@"webtoken"];
    }else{
        [manager.requestSerializer  setValue:@""
                          forHTTPHeaderField:@"webtoken"];
    }

    return [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}

+ (id)GETS:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    
    AFHTTPSessionManager *manager = [self sharedAFManager];
    manager.requestSerializer.timeoutInterval = 60;
    
    
    return [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}
+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
//    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
//    [securityPolicy setAllowInvalidCertificates:YES];
    
    AFHTTPSessionManager *manager = [self sharedAFManager];
    manager.requestSerializer.timeoutInterval  = 60;
    if([MyDefaults objectForKey:@"webtoken"]){
        [manager.requestSerializer  setValue:[MyDefaults objectForKey:@"webtoken"]
                          forHTTPHeaderField:@"webtoken"];
    }else{
        [manager.requestSerializer  setValue:@""
                          forHTTPHeaderField:@"webtoken"];
    }

//    [manager setSecurityPolicy:securityPolicy];
    return [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}
+ (id)POSTS:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    //    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    //    [securityPolicy setAllowInvalidCertificates:YES];
    
    AFHTTPSessionManager *manager = [self sharedAFManager];
    manager.requestSerializer.timeoutInterval  = 60;
   
    
    //    [manager setSecurityPolicy:securityPolicy];
    return [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}

+ (id)POSTIMAGE:(NSString *)path parameters:(NSDictionary *)params formData:(NSMutableArray *)dataArray fileName:(NSMutableArray *)nameArray completionHandle:(void (^)(id, NSError *))completionHandle{
    
    __block SMLProgressView *progress = [[SMLProgressView alloc] init];
    
    progress.progressTitle = @"上传图片";
    
    progress.isTitleShowPercentTage = YES;
    
    [progress showProgress];
    
    AFHTTPSessionManager *manager = [self sharedAFManager];
    manager.requestSerializer.timeoutInterval = 60;
    
    return [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for(NSInteger i=0; i<dataArray.count; i++){
            NSData *data = [dataArray objectAtIndex:i];
            NSString *imageName = [NSString stringWithFormat:@"%@.png",[nameArray objectAtIndex:i]];
            [formData appendPartWithFileData:data name:imageName fileName:imageName mimeType:@"image/jpeg"];
        }
       
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"已下载 %lld, 全部 %lld", uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
        
        CGFloat perentage = uploadProgress.completedUnitCount / (uploadProgress.totalUnitCount * 1.0);
        
        progress.percentage = perentage;
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        [progress hiddenProgress];
        
        [progress showAlert:@"上传图片成功"];
        
        completionHandle(responseObject, nil);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [progress hiddenProgress];
        
        [progress showAlert:@"上传图片失败"];
        
        completionHandle(nil, error);
        
    }];
    
}

@end














