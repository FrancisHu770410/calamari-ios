//
//  NotificationView.m
//  inWinStackCeph
//
//  Created by Francis on 2015/6/3.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "NotificationView.h"
#import "UIColor+Reader.h"
#import "LocalizationManager.h"

@implementation NotificationView

- (instancetype) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor oceanBackgroundOneColor];
        
        self.okView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - ((CGRectGetWidth(self.frame) * 0.5) / 2), CGRectGetMidY(self.frame) - ((CGRectGetWidth(self.frame) * 0.5) / 2) - 60, (CGRectGetWidth(self.frame) * 0.5), (CGRectGetWidth(self.frame) * 0.5))];
        self.okView.image = [UIImage imageNamed:@"OSDHealthOKView"];
        self.okView.contentMode = UIViewContentModeScaleAspectFill;
        self.okView.alpha = 0;
        [self addSubview:self.okView];
        
        self.okLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - 100, CGRectGetMaxY(self.okView.frame) + 25, 200, 50)];
        self.okLabel.alpha = 0;
        self.okLabel.textColor = [UIColor unitTextDefalutGrayColor];
        self.okLabel.numberOfLines = 0;
        self.okLabel.textAlignment = NSTextAlignmentCenter;
        self.okLabel.text = [[LocalizationManager sharedLocalizationManager] getTextByKey:@"notification_work_find"];
        [self addSubview:self.okLabel];
    }
    return self;
}

@end
