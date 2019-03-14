//
//  NSObject+Network.h
//  BaseProject
//
//  Created by 牛犇 on 15/12/16.
//  Copyright © 2015年 shangmenle. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 请求类型:Get Post
 Get: 传递小型数据, 数据
 Post: 传递大型数据, 传zip/图片/音乐...
 具体使用哪个请求: 由服务器人员规定
 */
#define kCompletionHandle  completionHandle:(void(^)(id model, NSError *error))completionHandle;

@interface NSObject (Network)

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle

+ (id)GETS:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle

+ (id)POSTS:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle

+ (id)POSTIMAGE:(NSString *)path parameters:(NSDictionary *)params formData:(NSMutableArray *)dataArray fileName:(NSMutableArray *)nameArray  kCompletionHandle

@end












