//
//  LSCDMembersCellView.h
//  TongParty
//
//  Created by 刘帅 on 2017/10/28.
//  Copyright © 2017年 桐聚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSCDMembersCellView : UIView
@property (nonatomic, copy) void(^onClickBlcok)(NSInteger index);
@end
