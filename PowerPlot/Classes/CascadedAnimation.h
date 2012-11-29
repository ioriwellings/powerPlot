//
//  CascadedAnimation.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/14/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"
#import "PowerPlot.h"

@interface CascadedAnimation : ExampleChartController

@property (nonatomic, retain) IBOutlet WSChart *chart;

/** Perform animations with different zooms, cycle animations. */
#ifdef __IPHONE_4_0
- (void)zoomToRegion1;
- (void)zoomToRegion2;
- (void)zoomToRegion3;
#endif

@end
