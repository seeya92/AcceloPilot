//
//  staff.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "Staff.h"

@implementation Staff

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"staffID": @"id",
        @"firstName": @"firstname",
        @"surName": @"surname"
    };
}

@end
