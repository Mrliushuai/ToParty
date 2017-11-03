//
//  DDUsercenterHeaderView.h
//  TongParty
//
//  Created by 方冬冬 on 2017/11/1.
//  Copyright © 2017年 桐聚. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DDHeaderViewType) {
    /** 已登录*/
    DDHeaderViewTypeLogined,
    /** 未登录*/
    DDHeaderViewTypeUnlogined
};

@interface DDUsercenterHeaderView : UIView

@property (nonatomic, assign) DDHeaderViewType type;

@property (nonatomic, copy) void(^loginRegisterClickBlcok)(NSInteger index);
@end
