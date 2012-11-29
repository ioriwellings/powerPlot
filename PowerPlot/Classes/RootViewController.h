//
//  RootViewController.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import <UIKit/UIKit.h>


/// The root view controller, containing a list of secondary view controllers.

@interface RootViewController : UITableViewController

/** The list of secondary view controllers with sample plots. */
@property (nonatomic, retain) NSArray *chartSamples;

@end
