//
//  FailedBanks.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 27.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "FailedBanks.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation FailedBanks

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create and configure a bar chart.
    WSChart *barChart = [WSChart barPlotWithFrame:[self.view bounds]
                                             data:[DemoData failedBanks]
                                            style:kChartBarPlain
                                      colorScheme:kColorWhite];
    WSPlotAxis *axis = [barChart firstPlotAxis];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@""];
    [[axis ticksX] setTickLabelsWithFormatter:formatter];
    [formatter release];
    [barChart setChartTitle:NSLocalizedString(@"Failed banks by year", @"")];
    
    barChart.autoresizingMask = 63;
    [[self view] addSubview:barChart];
}

@end
