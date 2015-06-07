//
//  AppDelegate.m
//  jacketReminder
//
//  Created by Christopher Peyton on 5/18/15.
//  Copyright (c) 2015 Christopher Peyton. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //Error 1 - Location service denied
    if ([notification.alertTitle isEqualToString:@" Location Service "])
    {
        //LOCALIZED VERSION
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString( @"Location Service", @"" ) message:NSLocalizedString( @"Enter your message here.", @"" ) preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString( @"Cancel", @"" ) style:UIAlertActionStyleCancel handler:nil];
//        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:NSLocalizedString( @"Settings", @"" ) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
//                                                        UIApplicationOpenSettingsURLString]];
//        }];

        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location access required" message:@"Phone cannot access location.\nOr\nApp was denied access to location." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                        UIApplicationOpenSettingsURLString]];
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:settingsAction];
        
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    
    else if ([notification.alertTitle isEqualToString:@"Location Service"])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location access" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *OkAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                         {
                                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                                                         UIApplicationOpenSettingsURLString]];
                                         }];
        
        [alertController addAction:OkAction];
        
        //[alertController addAction:settingsAction];
        
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"\n\n\napplicationWillResignActive\n\n\n");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"\n\n\nDID ENTER BACKGROUND\n\n\n");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     NSLog(@"\n\n\napplicationWillEnterForeground\n\n\n");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     NSLog(@"\n\n\napplicationDidBecomeActive\n\n\n");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
     NSLog(@"\n\n\napplicationWillTerminate\n\n\n");
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"\n\n\napplicationDidReceiveMemoryWarning\n\n\n");

    
}


@end
