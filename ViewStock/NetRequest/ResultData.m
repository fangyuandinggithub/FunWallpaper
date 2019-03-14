//
//  ResultData.m
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import "ResultData.h"

@implementation ResultData

@synthesize code;

@synthesize msg;
@synthesize datadic;

- (id)init
{
    self = [super init];
    if (self != nil) {
        code     = @"";
        msg      = @"";
        datadic  = @{};
    }
    return self;
}

@end
