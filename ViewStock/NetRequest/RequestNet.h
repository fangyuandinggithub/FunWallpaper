//
//  RequestNet.h
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultData.h"
NS_ASSUME_NONNULL_BEGIN

@interface RequestNet : NSObject


+ (instancetype)manager;

- (void )GetHoroscopeDescripByTimeType:(NSString *)timeType HoroscopeName:(NSString *)name withBlock:(void (^)(NSData *postData,ResultData *status,NSError *error))block;

- (void )GetHoroscopeMatchByLeftName:(NSString * )leftName RigthName:(NSString *)rightName  withBlock:(void (^)(NSData *postData,ResultData *status,NSError *error))block;

@end





NS_ASSUME_NONNULL_END
