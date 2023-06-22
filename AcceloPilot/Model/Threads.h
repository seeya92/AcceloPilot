//
//  Threads.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Activity.h"
#import "Mantle.h"

@interface Threads : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSArray *activities;
@property (nonatomic, copy) NSString *eventText;
@property (nonatomic, copy) NSString *threadID;
@property (nonatomic) NSArray *interacts;
@property (nonatomic, copy) NSString *totalActivities;

@end
