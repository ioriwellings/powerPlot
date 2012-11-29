//
//  ElectionBars.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ElectionBars.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation ElectionBars

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create data set.
    WSData *barData = [[DemoData electionResults2009] indexedData];
    
    // Create and configure a bar plot.
    WSChart *electionChart = [WSChart barPlotWithFrame:[self.view bounds]
                                                  data:barData
                                             barColors:[NSArray
                                                        arrayWithObjects:[UIColor CSSColorBlack],
                                                        [UIColor CSSColorYellow],
                                                        [UIColor CSSColorRed],
                                                        [UIColor CSSColorGreen],
                                                        [UIColor CSSColorTeal],
                                                        [UIColor CSSColorGray], nil]
                                                 style:kChartBarPlain
                                           colorScheme:kColorWhite];
    [electionChart scaleAllAxisYD:NARangeMake(-10, 45)];
    [electionChart setAllAxisLocationXD:-0.5];
    [electionChart setAllAxisLocationYD:0];
    
    // Some customization of the resulting chart.
    WSPlotBar *bar = (WSPlotBar *)[[electionChart plotAtIndex:0] view];
    [bar setValue:[UIColor blackColor]
       forKeyPath:@"dataDelegate.dataD.values.customDatum.outlineColor"];

    WSPlotAxis *axis = [electionChart firstPlotAxis];
    [[axis ticksX] setTicksStyle:kTicksLabels];
    [[axis ticksY] setTicksStyle:kTicksLabels];
    [[axis ticksY] ticksWithNumbers:[NSArray arrayWithObjects:
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:10],
                                     [NSNumber numberWithFloat:20],
                                     [NSNumber numberWithFloat:30],
                                     nil]
                             labels:[NSArray arrayWithObjects:@"",
                                     @"10%", @"20%", @"30%", nil]];
    [electionChart setChartTitle:NSLocalizedString(@"Bundestagselection 2009", @"")];

    electionChart.autoresizingMask = 63;
    [self.view addSubview:electionChart];
}

@end
