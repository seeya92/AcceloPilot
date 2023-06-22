//
//  Affiliation.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "Affiliation.h"

@implementation Affiliation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"affiliationsID": @"id",
        @"email": @"email",
        @"mobile": @"mobile"
    };
}

@end
