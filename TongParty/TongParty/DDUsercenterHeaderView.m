//
//  DDUsercenterHeaderView.m
//  TongParty
//
//  Created by 方冬冬 on 2017/11/1.
//  Copyright © 2017年 桐聚. All rights reserved.
//

#import "DDUsercenterHeaderView.h"
#import "DDLabelView.h"
#import "UIView+Layer.h"

#define kAvatarWidth   50
#define kMarginGapWidth 18
#define kActivityItemWidth (kScreenWidth - kMarginGapWidth*6)/5

//不支持横屏的情况下
#define kTopViewHeight(SCREEN_MAX_LENGTH) \
({\
float height = 0;\
if (SCREEN_MAX_LENGTH==568)\
height=170;\
else if (SCREEN_MAX_LENGTH==667)\
height=235;\
else if(SCREEN_MAX_LENGTH==736)\
height=250;\
else if(SCREEN_MAX_LENGTH==812)\
height=305;\
(height);\
})\

@interface DDUsercenterHeaderView()

@end

@implementation DDUsercenterHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
//    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"person_bg_image"]];
}




#pragma mark - set
-(void)setType:(DDHeaderViewType)type{
    switch (type) {
        case DDHeaderViewTypeLogined:
        {
            [self setupLoginedUI];
        }
            break;
        case DDHeaderViewTypeUnlogined:
        {
            [self setupUnloginedUI];
        }break;
        default:
            break;
    }
}
- (void)setupLoginedUI{

}



- (void)setupUnloginedUI{
    
    //头像的上间隔
    float topOriginY = 0;
    //参加次数与上面控件的间距
    float lastLabelMargin = 0;
    if (IS_IPHONE_5) {
        topOriginY = -140;
        lastLabelMargin = 10;
    }else if (IS_IPHONE_6){
        topOriginY = -180;
        lastLabelMargin = 40;
    }else if (IS_IPHONE_6P){
        topOriginY = -190;
        lastLabelMargin = 40;
    }else if (iPhoneX){
        topOriginY = -200;
        lastLabelMargin = 40;
    }else{
    }
    UIImageView *bgView = [UIImageView new];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    bgView.image = [UIImage imageNamed:@"person_bg_image"];
    bgView.contentMode = UIViewContentModeScaleAspectFill;
    bgView.userInteractionEnabled = YES;
    [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeBgClick:)]];
    //头像
    UIImageView *_avatar = [UIImageView new];
    [bgView addSubview:_avatar];
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(kAvatarWidth);
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(100);
    }];
    _avatar.layerCornerRadius = 25;
    _avatar.image = [UIImage imageNamed:@"AppIcon"];
    
    UILabel *line = [UILabel new];
    [bgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_avatar.mas_bottom).offset(45);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(10);
        make.centerX.mas_equalTo(self);
    }];
    line.backgroundColor = kWhiteColor;
    
    
    UIButton *loginBtn = [UIButton new];
    [bgView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_avatar.mas_bottom).offset(35);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(line.mas_left).offset(-5);
    }];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [loginBtn setTitleColor:kBgGreenColor forState:UIControlStateHighlighted];
    loginBtn.titleLabel.font = kFont(15);
    loginBtn.tag = 20;
    [loginBtn addTarget:self action:@selector(enterLoginVC:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *registerBtn = [UIButton new];
    [bgView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_avatar.mas_bottom).offset(35);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(line.mas_right).offset(5);
    }];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [registerBtn setTitleColor:kBgGreenColor forState:UIControlStateHighlighted];
    registerBtn.titleLabel.font = kFont(15);
    registerBtn.tag = 21;
    [registerBtn addTarget:self action:@selector(enterLoginVC:) forControlEvents:UIControlEventTouchUpInside];
    
    //活动参加率
    UILabel *joinRateLbl = [UILabel new];
    [bgView addSubview:joinRateLbl];
    [joinRateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kAvatarWidth * 4);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(lastLabelMargin);
        make.centerX.mas_equalTo(self);
    }];
    //    joinRateLbl.text = @"实到6/7创建       实到7/9参与";
    joinRateLbl.textAlignment = NSTextAlignmentCenter;
    joinRateLbl.textColor = kWhiteColor;
    joinRateLbl.font = kFont(12);
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"实到0/0创建       实到0/0参与"];
    NSRange strRange = {2,3};
    NSRange strRange1 = {16,3};
    [str addAttributes:@{
                         NSFontAttributeName:kFont(17)
                         } range:strRange];
    [str addAttributes:@{
                         NSFontAttributeName:kFont(15)
                         } range:strRange1];
    joinRateLbl.attributedText  = str;
}

-(void)enterLoginVC:(UIButton *)sender{
    if (_loginRegisterClickBlcok) {
        _loginRegisterClickBlcok(sender.tag - 20);
    }
}
@end












