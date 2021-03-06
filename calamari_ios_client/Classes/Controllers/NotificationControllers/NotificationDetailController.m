//
//  NotificationDetailController.m
//  calamari_ios_client
//
//  Created by Francis on 2015/9/3.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "NotificationDetailController.h"
#import "UIColor+Reader.h"
#import "NotificationDetailView.h"
#import "DateMaker.h"
#import "HelpView.h"

@interface NotificationDetailController ()

@end

@implementation NotificationDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[LocalizationManager sharedLocalizationManager] getTextByKey:@"main_activity_fragment_notification_detail"];
    [self setBackButtonDisplay:YES];
    NSString *timeDataString = [[DateMaker shareDateMaker] getTodayWithNotificationFormatWithTimeStamp:[self.dataDic[@"Time"] doubleValue]];
    NSString *errorType = [NSString stringWithFormat:@"%@", self.dataDic[@"Type"]];
    NSString *errorCondtionType = [NSString stringWithFormat:@"%@", self.dataDic[@"Status"]];
    NSString *contentString = [NSString stringWithFormat:@"%@", [[LocalizationManager sharedLocalizationManager] getTextByKey:self.dataDic[@"Content"]]];
    NSString *errorTitleString = [NSString stringWithFormat:@"%@", [[LocalizationManager sharedLocalizationManager] getTextByKey:self.dataDic[@"ErrorTitle"]]];
    NSString *errorCountString = [NSString stringWithFormat:@"%@", self.dataDic[@"ErrorCount"]];
    NSString *errorTimeString = [NSString stringWithFormat:@"%@\n%@", [[LocalizationManager sharedLocalizationManager] getTextByKey:@"notification_detail_triggered_title"], timeDataString];
    
    NSRange rangeOfPercent = [contentString rangeOfString:@"%"];
    if (rangeOfPercent.location < contentString.length) {
        
        NSString *currentNumberString = self.dataDic[@"currentTrigger"];
        
        contentString = [contentString stringByReplacingOccurrencesOfString:@"70" withString:currentNumberString];
        
    }
    
    
    ([errorType isEqualToString:@"Error"]) ? [self.navigationController.navigationBar setBarTintColor:[UIColor errorColor]] : [self.navigationController.navigationBar setBarTintColor:[UIColor warningColor]] ;
    self.notificationDetailView = [[NotificationDetailView alloc] initWithFrame:self.view.frame];
    self.view = self.notificationDetailView;
    
    [self.notificationDetailView.helpButton addTarget:self action:@selector(helpAction) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.dataDic[@"ResolveTime"]) {
        NSString *resolvedtimeDataString = [[DateMaker shareDateMaker] getTodayWithNotificationFormatWithTimeStamp:[self.dataDic[@"ResolveTime"] doubleValue]];
        NSString *resolvedTimeString = [NSString stringWithFormat:@"%@\n%@", [[LocalizationManager sharedLocalizationManager] getTextByKey:@"notification_detail_resolved_title"], resolvedtimeDataString];
        contentString = [NSString stringWithFormat:@"%@", [[LocalizationManager sharedLocalizationManager] getTextByKey:self.dataDic[@"ResolveContent"]]];
        
        NSRange rangeOfResolvePercent = [contentString rangeOfString:@"%"];
        if (rangeOfResolvePercent.location < contentString.length) {

            NSString *currentResolveNumberString = self.dataDic[@"currentTrigger"];
            
            contentString = [contentString stringByReplacingOccurrencesOfString:@"70" withString:currentResolveNumberString];
            
        }
        
        [self.notificationDetailView setContentWithContent:contentString status:errorCondtionType errorTitle:errorTitleString errorCount:errorCountString errorTimeString:errorTimeString resolveTimeString:resolvedTimeString];
    } else {
        [self.notificationDetailView setContentWithContent:contentString status:errorCondtionType errorTitle:errorTitleString errorCount:errorCountString errorTimeString:errorTimeString resolveTimeString:@""];
    }
}

- (void) helpAction {
    HelpView *helpView = [[HelpView alloc] initWithTitle:[[LocalizationManager sharedLocalizationManager] getTextByKey:@"osd_detail_re_weight_help_title"] message:[[LocalizationManager sharedLocalizationManager] getTextByKey:@"notification_detail_count_help"]];
    [self.view.window addSubview:helpView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
