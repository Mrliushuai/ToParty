//
//  FDDMenuItem.m
//  TongParty
//
//  Created by 方冬冬 on 2017/10/31.
//  Copyright © 2017年 桐聚. All rights reserved.
//

#import "FDDMenuItem.h"

@interface FDDMenuItem()
@property (nonatomic, assign) BOOL showSelected;
@end

@implementation FDDMenuItem
@synthesize showSelected = _showSelected;

#pragma mark - Public Methods
+ (instancetype)menuItem:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action {
    FDDMenuItem *item = [[FDDMenuItem alloc] init:title image:image tag:0 userInfo:nil target:target action:action];
    item.alignment = NSTextAlignmentCenter;
    item.showSelected = (item.target != nil && item.action != NULL);
    return item;
}

+ (instancetype)menuItem:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag userInfo:(NSDictionary *)userInfo {
    FDDMenuItem *item = [[FDDMenuItem alloc] init:title image:image tag:tag userInfo:userInfo target:nil action:NULL];
    item.alignment = NSTextAlignmentCenter;
    item.showSelected = YES;
    return item;
}

+ (instancetype)menuTitle:(NSString *)title WithIcon:(UIImage *)icon {
    FDDMenuItem *item = [[FDDMenuItem alloc] init:title image:icon tag:0 userInfo:nil target:nil action:NULL];
    item.showSelected = NO;
    item.alignment = NSTextAlignmentCenter;
    return item;
}

- (BOOL)enabled {
    return self.showSelected;
}

- (void)performAction {
    __strong id target = self.target;
    if (target && [target respondsToSelector:_action]) {
        [target performSelectorOnMainThread:_action withObject:self waitUntilDone:YES];
    }
}

#pragma mark - Private Methods

/// init
- (id)init:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag userInfo:(NSDictionary *)userInfo target:(id)target action:(SEL) action {
    NSParameterAssert(title.length || image);
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _tag =tag;
        _userInfo = userInfo;
        _target = target;
        _action = action;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ :%p> \n {\n\ttitle: %@,\n\timage: %@,\n\ttag: %zd,\n\tuserInfo: %@\n}\n", [self class], self, _title, _image, _tag, _userInfo];
}

@end
