//
//  LSAddressTableViewCell.h
//  TongParty
//
//  Created by 刘帅 on 2017/10/28.
//  Copyright © 2017年 桐聚. All rights reserved.
//

#import "DDBaseTableViewCell.h"

@interface LSAddressTableViewCell : DDBaseTableViewCell
@property (nonatomic, copy) void(^onClickBlcok)(NSInteger index);
@end
