//
//  ContourPlot.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 25.11.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ContourPlot.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation ContourPlot

- (void)viewDidLoad {
    [super viewDidLoad];

    // Step 1: Create the chart with data points and coordinate axis.
    WSChart *contourChart = [WSChart linePlotWithFrame:[self.view bounds]
                                                  data:[DemoData scatteredPoints]
                                                 style:kChartLineScientific
                                             axisStyle:kCSPlain
                                           colorScheme:kColorLight
                                                labelX:NSLocalizedString(@"x", @"")
                                                labelY:NSLocalizedString(@"y", @"")];
    WSPlotData *dataPlot = (WSPlotData *)[[contourChart plotAtIndex:0] view];
    [dataPlot setStyle:kCustomStyleUnified];
    [dataPlot setLineStyle:kLineNone];
    [[dataPlot propDefault] setSymbolStyle:kSymbolTriangleLeft];
    [[dataPlot propDefault] setSymbolSize:5.0];
    
    // Step 2: Add a contour region.
    [contourChart generateControllerWithData:[DemoData centerRegion]
                                   plotClass:[WSPlotRegion class]
                                       frame:[self.view bounds]];
    [(WSPlotRegion *)[[contourChart lastPlot] view]
     setFillColor:UICOLORRGB(60, 60, 100)];
    
    // Step 3: Add another contour region.
    [contourChart generateControllerWithData:[DemoData centerRegionWide]
                                   plotClass:[WSPlotRegion class]
                                       frame:[self.view bounds]];
    [(WSPlotRegion *)[[contourChart lastPlot] view]
     setFillColor:UICOLORRGB(80, 80, 100)];
    
    // Ensure proper ordering of plots.
    [contourChart exchangePlotAtIndex:0 withPlotAtIndex:3];
    
    // Finally, rescale all axis.
    [contourChart autoscaleAllAxisX];
    [contourChart autoscaleAllAxisY];

    contourChart.autoresizingMask = 63;
    [self.view addSubview:contourChart];
}

@end

