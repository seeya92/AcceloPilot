//
//  Interact.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interact.h"

@implementation Interact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"interactsID": @"id",
        @"dateActioned": @"date_actioned",
        @"type": @"type",
        @"ownerType": @"owner_type",
        @"ownerID": @"owner_id",
        @"email": @"email",
        @"ownerName": @"owner_name"
    };
}

@end
