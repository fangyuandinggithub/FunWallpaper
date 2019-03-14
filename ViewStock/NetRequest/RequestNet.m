//
//  RequestNet.m
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import "RequestNet.h"
@implementation RequestNet

+ (instancetype)manager {
    
    static RequestNet *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RequestNet alloc] init];
    });
    return manager;
}
//获取星座日期描述
- (void )GetHoroscopeDescripByTimeType:(NSString *)timeType HoroscopeName:(NSString *)name withBlock:(void (^)(NSData *postData,ResultData *status,NSError *error))block{
    NSURL * url =  url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.ganeshaspeaks.com/horoscopes/%@/%@/",timeType,name]];;
    
    ResultData *status = [[ResultData alloc] init];
    NSData * htmlData = [NSData dataWithContentsOfURL:url] ;
    if(htmlData.length > 0){
        status.code =  @"1";
    }else{
        status.code = @"0";
    }
    if (block) {
        block(htmlData,status,nil);
    }
    
    
}


- (void )GetHoroscopeMatchByLeftName:(NSString * )leftName RigthName:(NSString *)rightName  withBlock:(void (^)(NSData *postData,ResultData *status,NSError *error))block{
     NSURL *matchDetailUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.astrology.com/horoscope/%@/%@.html",leftName,rightName]];
    ResultData *status = [[ResultData alloc] init];
    NSData * htmlData = [NSData dataWithContentsOfURL:matchDetailUrl] ;
    
    
    if(htmlData.length > 0){
        status.code =  @"1";
    }else{
        status.code = @"0";
    }
    if (block) {
        block(htmlData,status,nil);
    }
    
}
@end
