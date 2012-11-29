//
//  MultiLines.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 04.08.11.
//  Copyright 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "MultiLines.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation MultiLines

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a few line plots with their controllers.
    [self.chart generateControllerWithData:nil
                                 plotClass:[WSPlotAxis class]
                                     frame:self.chart.frame];
    WSPlotAxis *axis = (WSPlotAxis *)[self.chart lastPlot].view;
    [self.chart generateControllerWithData:[DemoData stocks1]
                                 plotClass:[WSPlotData class]
                                     frame:self.chart.frame];
    WSPlotData *line1 = (WSPlotData *)[self.chart lastPlot].view;
    [self.chart generateControllerWithData:[DemoData stocks2]
                                 plotClass:[WSPlotData class]
                                     frame:self.chart.frame];
    WSPlotData *line2 = (WSPlotData *)[self.chart lastPlot].view;
    [self.chart generateControllerWithData:[DemoData stocks3]
                                 plotClass:[WSPlotData class]
                                     frame:self.chart.frame];
    WSPlotData *line3 = (WSPlotData *)[self.chart lastPlot].view;
    [self.chart generateControllerWithData:[DemoData stocks4]
                                 plotClass:[WSPlotData class]
                                     frame:self.chart.frame];
    WSPlotData *line4 = (WSPlotData *)[self.chart lastPlot].view;

    // Configure the appearance of the lines.
    axis.axisX.axisStyle = kAxisPlain;
    axis.axisY.axisStyle = kAxisNone;
    axis.axisY.gridStyle = kGridDotted;
    [axis.ticksX setTickLabelsWithStrings:[NSArray arrayWithObjects:@"J", @"F", @"M",
                                           @"A", @"M", @"J", @"J", @"A", @"S", @"O",
                                           @"N", @"D", nil]];
    axis.ticksX.ticksStyle = kTicksLabels;
    axis.axisStrokeWidth = 2.0;
    [axis.ticksY autoTicksWithRange:NARangeMake(0.0, 180.0) number:6];
    axis.ticksY.ticksDir = kTDirectionNone;
    axis.gridStrokeWidth = 1.0;
    line1.lineColor = [UIColor redColor];
    line2.lineColor = [UIColor blueColor];
    line3.lineColor = [UIColor greenColor];
    line4.lineColor = [UIColor blackColor];
    line1.propDefault.symbolStyle = kSymbolEmptySquare;
    line2.propDefault.symbolStyle = kSymbolTriangleUp;
    line3.propDefault.symbolStyle = kSymbolDisk;
    line4.propDefault.symbolStyle = kSymbolSquare;
    line1.propDefault.symbolColor = line1.lineColor;
    line2.propDefault.symbolColor = line2.lineColor;
    line3.propDefault.symbolColor = line3.lineColor;
    line4.propDefault.symbolColor = line4.lineColor;
    line3.propDefault.symbolSize = 8.0;
    line2.shadowEnabled = YES;
    line3.shadowEnabled = YES;
    line4.shadowEnabled = YES;
    line2.shadowScale = 2.0;
    line4.shadowScale = 10.0;
    line1.intStyle = kInterpolationSpline;
    line2.intStyle = kInterpolationSpline;
    line3.intStyle = kInterpolationSpline;
    
    // Finally, configure the axis and chart title.
    [self.chart autoscaleAllAxisX];
    [self.chart autoscaleAllAxisY];
    [self.chart setAllAxisLocationXD:0.0];
    [self.chart setAllAxisLocationYD:0.0];
    [self.chart setChartTitle:NSLocalizedString(@"Multiple stocks", @"")];
}


#pragma mark -

@synthesize chart = _chart;

- (void)viewDidUnload {
    [super viewDidUnload];
    self.chart = nil;
}

- (void)dealloc
{
    self.chart = nil;
    [super dealloc];
}

@end
