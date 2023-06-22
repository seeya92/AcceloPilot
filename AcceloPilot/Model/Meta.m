//
//  Meta.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "Meta.h"

@implementation Meta

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"message": @"message",
        @"moreInfo": @"more_info",
        @"status": @"status"
    };
}

@end
