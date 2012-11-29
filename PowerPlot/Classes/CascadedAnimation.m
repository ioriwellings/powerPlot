//
//  CascadedAnimation.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/14/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "CascadedAnimation.h"
#import "DemoData.h"

@implementation CascadedAnimation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Replicate the starting chart from the "FormFactor" example.
    WSChart *formFactorChart = [WSChart linePlotWithFrame:[self.chart bounds]
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
    [formFactorChart generateControllerWithData:[DemoData formFactorFit]
                                      plotClass:[WSPlotData class]
                                          frame:[self.chart frame]];
    WSPlotData *bestFit = (WSPlotData *)[[formFactorChart lastPlot] view];
    bestFit.lineWidth = 2;
    bestFit.lineColor = [UIColor blackColor];
    bestFit.propDefault.symbolStyle = kSymbolNone;
    [formFactorChart generateControllerWithData:[[DemoData formFactorFit] contourWithError]
                                      plotClass:[WSPlotRegion class]
                                          frame:[self.chart frame]];
    WSPlotRegion *errorBand = (WSPlotRegion *)[[formFactorChart lastPlot] view];
    [errorBand setFillColor:[UIColor grayColor]];
    [errorBand setLineColor:[UIColor clearColor]];
    [formFactorChart exchangePlotAtIndex:0 withPlotAtIndex:3];
    [self.chart addPlotsFromChart:formFactorChart];
    [self.chart autoscaleAllAxisX];
    [self.chart autoscaleAllAxisY];
    [[self.chart firstPlotAxis] autoTicksXD];
    [[self.chart firstPlotAxis] setTickLabelsX];
    [[self.chart firstPlotAxis] autoTicksYD];
    [[self.chart firstPlotAxis] setTickLabelsY];

    // Once the chart is set up, start the animation.
    [self.chart setAllAxisPreserveOnChangeX:kPreserveRelative];
    [self.chart setAllAxisPreserveOnChangeY:kPreserveRelative];
#ifdef __IPHONE_4_0
    [self zoomToRegion1];
#endif
}


#pragma mark - Perform a zoom to different parts of the chart, cycle zoom.

#ifdef __IPHONE_4_0
- (void)zoomToRegion1
{
    [self.chart dataAnimateWithDuration:2.
                             animations:^{
                                 WSCoordinate *cX = [[self.chart plotAtIndex:0] coordX];
                                 WSCoordinate *cY = [[self.chart plotAtIndex:0] coordY];
                                 cX.coordRangeD = NARangeMake(0.1, 0.3);
                                 cY.coordRangeD = NARangeMake(0.7, 0.8);
                             }
                             completion:^(BOOL completed) {
                                 if (completed) {
                                     [self zoomToRegion2];
                                 }
                             }];
}

- (void)zoomToRegion2
{
    [self.chart dataAnimateWithDuration:2.
                             animations:^{
                                 WSCoordinate *cX = [[self.chart plotAtIndex:0] coordX];
                                 WSCoordinate *cY = [[self.chart plotAtIndex:0] coordY];
                                 cX.coordRangeD = NARangeMake(0.9, 1.1);
                                 cY.coordRangeD = NARangeMake(0.4, 0.6);
                             }
                             completion:^(BOOL completed) {
                                 if (completed) {
                                     [self zoomToRegion3];
                                 }
                             }];    
}

- (void)zoomToRegion3
{
    [self.chart dataAnimateWithDuration:2.
                             animations:^{
                                 [self.chart autoscaleAllAxisX];
                                 [self.chart autoscaleAllAxisY];
                             }
                             completion:^(BOOL completed) {
                                 if (completed) {
                                     [self zoomToRegion1];
                                 }
                             }];
}
#endif


#pragma mark -

@synthesize chart = _chart;

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.chart = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.chart resetChart];
}

- (void)dealloc {
    self.chart = nil;
    
    [super dealloc];
}

@end
