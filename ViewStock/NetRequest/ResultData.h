//
//  ResultData.h
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResultData : NSObject

@property (nonatomic, retain) NSString *code;

@property (nonatomic, retain) NSString *msg;

@property (nonatomic, retain) NSDictionary *datadic;

@end

NS_ASSUME_NONNULL_END
