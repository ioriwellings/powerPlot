//
//  MixedAnimation.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/15/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"
#import "PowerPlot.h"

@interface MixedAnimation : ExampleChartController

/** The UI elements - a WSChart and a segmented control. */
@property (nonatomic, retain) IBOutlet WSChart *chart;
@property (nonatomic, retain) IBOutlet UISegmentedControl *aSwitch;

/** Invoked when the user presses the button. */
- (IBAction)toggleSwitch:(UISegmentedControl *)sender;


/** The two data sets involved: project cost and total net profit. */
@property (nonatomic, retain) WSData *projectCost;
@property (nonatomic, retain) WSData *totalProfit;


/** Animation to different scenarios. */
@property (nonatomic) NSUInteger current;
- (void)goodScenario;
- (void)badScenario;

@end
