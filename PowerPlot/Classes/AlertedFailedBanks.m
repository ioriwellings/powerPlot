//
//  AlertedFailedBanks.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 1/25/12.
//  Copyright (c) 2012 Numerik & Analyse Schroers. All rights reserved.
//

#import "AlertedFailedBanks.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation AlertedFailedBanks

- (void)viewDidLoad
{
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
    
#ifdef __IPHONE_4_0
    // Configure alerting function.
    WSPlotBar *barPlot = ((WSPlotBar *)[barChart firstPlotOfClass:[WSPlotBar class]]);
    WSPlotController *barCtrl = barPlot.plotController;
    barPlot.style = kCustomStyleIndividual;
    ((WSBarProperties *)barPlot.plotController.standardProperties).barColor = [UIColor blackColor];
    ((WSBarProperties *)barPlot.plotController.standardProperties).outlineColor = [UIColor blackColor];
    [barCtrl setAlertBlock:(alertBlock_t)^(WSDatum *datum){ 
        return (datum.valueY > 10);
    }];
    [barCtrl updateAlertedData];
#endif
    
    barChart.autoresizingMask = 63;
    [[self view] addSubview:barChart];
}

@end
