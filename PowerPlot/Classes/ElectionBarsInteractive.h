//
//  ElectionBarsInteractive.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 1/23/12.
//  Copyright (c) 2012 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"
#import "PowerPlot.h"

@interface ElectionBarsInteractive : ExampleChartController
    <WSControllerGestureDelegate>

@property (nonatomic, retain) WSData *barData;
@property (nonatomic, retain) IBOutlet WSChart *electionChart;
@property (nonatomic, retain) IBOutlet UILabel *resultLabel;

@end
