//
//  ScientificLines.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"

@class WSChart;

@interface ScientificLines : ExampleChartController {
@private
    WSChart *_choice[3];
}

@property (nonatomic, retain) IBOutlet WSChart *chart;
@property (nonatomic, retain) IBOutlet UISegmentedControl *chooser;

/** Redraw the chart if a different choice for the style have been selected. */
- (IBAction)updateChart;

@end
