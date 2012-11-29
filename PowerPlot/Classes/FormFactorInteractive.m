//
//  FormFactorInteractive.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 1/23/12.
//  Copyright (c) 2012 Numerik & Analyse Schroers. All rights reserved.
//

#import "FormFactorInteractive.h"
#import "DemoData.h"

@implementation FormFactorInteractive

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Replicate the starting chart from the "FormFactor" example.
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
    [formFactorChart generateControllerWithData:[DemoData formFactorFit]
                                      plotClass:[WSPlotData class]
                                          frame:[self.view bounds]];
    WSPlotData *bestFit = (WSPlotData *)[[formFactorChart lastPlot] view];
    bestFit.lineWidth = 2;
    bestFit.lineColor = [UIColor blackColor];
    bestFit.propDefault.symbolStyle = kSymbolNone;
    [formFactorChart generateControllerWithData:[[DemoData formFactorFit] contourWithError]
                                      plotClass:[WSPlotRegion class]
                                          frame:[self.view bounds]];
    WSPlotRegion *errorBand = (WSPlotRegion *)[[formFactorChart lastPlot] view];
    errorBand.fillColor = [UIColor grayColor];
    errorBand.lineColor = [UIColor clearColor];
    [formFactorChart exchangePlotAtIndex:0 withPlotAtIndex:3];
    [formFactorChart autoscaleAllAxisX];
    [formFactorChart autoscaleAllAxisY];
    [[formFactorChart firstPlotAxis] autoTicksXD];
    [[formFactorChart firstPlotAxis] setTickLabelsX];
    [[formFactorChart firstPlotAxis] autoTicksYD];
    [[formFactorChart firstPlotAxis] setTickLabelsY];

    // Now configure the zooming and scrolling behavior.
    [formFactorChart setAllAxisPreserveOnChangeX:kPreserveRelative];
    [formFactorChart setAllAxisPreserveOnChangeY:kPreserveRelative];
    WSPlotController *aCtrl = [formFactorChart lastPlot];
    [aCtrl setMaximumZoomScaleXD:2.
              maximumZoomScaleYD:2.
              minimumZoomScaleXD:0.75
              minimumZoomScaleYD:0.75];
    NAFloat scaleX = NARangeLen(aCtrl.zoomRangeXD);
    NAFloat scaleY = NARangeLen(aCtrl.zoomRangeYD);
    aCtrl.zoomRangeXD = NARangeMake(scaleX/3, scaleX*1.25);
    aCtrl.zoomRangeYD = NARangeMake(scaleY/3, scaleY*1.25);
    aCtrl.zoomEnabled = YES;
    aCtrl.scrollEnabled = YES;
    
    // Configure the single tap feature.
    aCtrl.tapEnabled = YES;
    aCtrl.delegate = self;
    aCtrl.hitTestMethod = (kHitTestX | kHitTestY);
    aCtrl.hitResponseMethod = kHitResponseDatum;
    
    formFactorChart.autoresizingMask = 63;
    [self.view addSubview:formFactorChart];
}


#pragma mark - WSControllerGestureDelegate

- (void)controller:(WSPlotController *)controller
  singleTapAtDatum:(NSInteger)i {
    NSLog(@"Datum hit: %d.", i);
}

@end
