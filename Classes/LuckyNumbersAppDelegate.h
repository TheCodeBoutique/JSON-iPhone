//
//  LuckyNumbersAppDelegate.h
//  LuckyNumbers
//
//  Created by Kyle Carriedo on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LuckyNumbersViewController;

@interface LuckyNumbersAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LuckyNumbersViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LuckyNumbersViewController *viewController;

@end

