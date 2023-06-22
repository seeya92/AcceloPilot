//
//  Interact.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mantle.h"

@interface Interact : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSString *interactsID;
@property (nonatomic) NSString *dateActioned;

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *ownerType;
@property (nonatomic) NSString *ownerID;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *ownerName;

@end
