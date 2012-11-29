//
//  FormFactor.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.11.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "FormFactor.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation FormFactor

- (void)viewDidLoad {
    [super viewDidLoad];

    // Step 1: Basic chart with coordinate system and data points with uncertainties.
    WSChart *formFactorChart = [WSChart linePlotWithFrame:[self.view bounds]
                                                     data:[DemoData formFactorMeasured]
                                                    style:kChartLineScientific
                                                axisStyle:kCSArrows
                                              colorScheme:kColorLight
                                                   labelX:NSLocalizedString(@"Virtuality", @"")
                                                   labelY:NSLocalizedString(@"F1 form factor", @"")];
    WSPlotData *dataPlot = (WSPlotData *)[[formFactorChart plotAtIndex:0] view];
    dataPlot.lineStyle = kLineNone;
    dataPlot.propDefault.symbolStyle = kSymbolDiamond;
    dataPlot.propDefault.symbolSize = 10;
    
    // Step 2: The best fit line.
    [formFactorChart generateControllerWithData:[DemoData formFactorFit]
                                      plotClass:[WSPlotData class]
                                          frame:[self.view bounds]];
    WSPlotData *bestFit = (WSPlotData *)[[formFactorChart lastPlot] view];
    bestFit.lineWidth = 2;
    bestFit.lineColor = [UIColor blackColor];
    bestFit.propDefault.symbolStyle = kSymbolNone;

    // Step 3: The uncertainty error band.
    [formFactorChart generateControllerWithData:[[DemoData formFactorFit] contourWithError]
                                      plotClass:[WSPlotRegion class]
                                          frame:[self.view bounds]];
    WSPlotRegion *errorBand = (WSPlotRegion *)[[formFactorChart lastPlot] view];
    errorBand.fillColor = [UIColor grayColor];
    errorBand.lineColor = [UIColor clearColor];

    // Ensure proper ordering of plots.
    [formFactorChart exchangePlotAtIndex:0 withPlotAtIndex:3];
    
    // Scale all axis and set the ticks and labels.
    [formFactorChart autoscaleAllAxisX];
    [formFactorChart autoscaleAllAxisY];
    [[formFactorChart firstPlotAxis] autoTicksXD];
    [[formFactorChart firstPlotAxis] setTickLabelsX];
    [[formFactorChart firstPlotAxis] autoTicksYD];
    [[formFactorChart firstPlotAxis] setTickLabelsY];

    formFactorChart.autoresizingMask = 63;
    [self.view addSubview:formFactorChart];
}

@end
