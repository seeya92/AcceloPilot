//
//  Activity.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "Activity.h"

@implementation Activity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"confidential": @"confidential",
        @"previewBody": @"preview_body",
        @"subject": @"subject",
        @"dateLogged": @"date_logged",
        @"interacts": @"interacts",
        @"activityID": @"id",
        @"eventText": @"event_text"
    };
}

+ (NSValueTransformer *)interactsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Interact class]];
}

@end
