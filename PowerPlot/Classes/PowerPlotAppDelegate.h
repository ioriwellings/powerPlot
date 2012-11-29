//
//  PowerPlotAppDelegate.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import <UIKit/UIKit.h>


/// The app delegate.

@interface PowerPlotAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

/** Main window of the application. */
@property (nonatomic, retain) IBOutlet UIWindow *window;

/** The navigation controller, handled by the RootViewController. */
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

