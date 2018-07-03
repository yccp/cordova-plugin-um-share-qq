#import "UMShareQQ.h"

@implementation UMShareQQ
- (void)pluginInitialize
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    
}

- (void)finishLaunching:(NSNotification *)notification
{
    // Put here the code that should be on the AppDelegate.m
    // 获取AppKey
    NSString *appKey = [[self.commandDelegate settings] objectForKey:@"um_share_qq_id"];
    NSString *appSecret = [[self.commandDelegate settings] objectForKey:@"um_share_qq_key"];
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     100424468.no permission of union id
     [QQ/QZone平台集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_3
    */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:appKey appSecret:appSecret redirectURL:nil];
}

@end
