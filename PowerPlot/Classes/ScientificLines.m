//
//  ScientificLines.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ScientificLines.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation ScientificLines

- (void)viewDidLoad {
    [super viewDidLoad];

    // Our test data.
    WSData *testD = [DemoData scientificData];

    // Manually configure the plot choice0.
    // This demonstrates how widely a data plot can be configured.
    _choice[0] = [[WSChart alloc] initWithFrame:[self.chart frame]];
    [_choice[0] resetChart];
    WSPlotAxis *axis = [[WSPlotAxis alloc] initWithFrame:[self.chart frame]];
    WSPlotData *lines = [[WSPlotData alloc] initWithFrame:[self.chart frame]];
    axis.axisX.axisStyle = kAxisArrowFilledHead;
    axis.axisY.axisStyle = kAxisArrowFilledHead;
    axis.axisX.labelStyle = kLabelInside;
    axis.axisX.axisLabel = NSLocalizedString(@"Crystal orientation", @"");
    axis.axisY.labelStyle = kLabelInside;
    axis.axisY.axisLabel = NSLocalizedString(@"Energy output", @"");
    axis.axisColor = [UIColor blackColor];
    axis.ticksX.ticksDir = kTDirectionInOut;
    axis.ticksY.ticksDir = kTDirectionInOut;
    axis.gridColor = [UIColor grayColor];
    axis.gridStrokeWidth = 1.0;
    axis.axisX.gridStyle = kGridDotted;
    axis.axisY.gridStyle = kGridDotted;
    lines.propDefault.symbolSize = 15.0;
    lines.propDefault.symbolStyle = kSymbolSquare;
    lines.propDefault.symbolColor = [UIColor greenColor];
    lines.propDefault.errorStyle = kErrorXYCapped;
    lines.lineStyle = kLineRegular;
    lines.dashStyle = kDashingDashed;
    lines.intStyle = kInterpolationStraight;
    lines.shadowEnabled = YES;
    lines.shadowScale = 5.0;
    lines.shadowColor = [UIColor blackColor];
    WSPlotController *axisController = [[WSPlotController alloc] init];
    WSPlotController *linesController = [[WSPlotController alloc] init];
    [axisController setView:axis];
    [linesController setView:lines];
    [axisController setDataD:testD];
    [linesController setDataD:testD];
    [_choice[0] addPlot:axisController];
    [_choice[0] addPlot:linesController];
    [_choice[0] autoscaleAllAxisX];
    [_choice[0] autoscaleAllAxisY];
    [axis autoTicksXD];
    [axis autoTicksYD];
    [axis setTickLabelsX];
    [axis setTickLabelsY];
    [[axis ticksX] setTicksStyle:kTicksLabelsSlanted];
    [[axis ticksY] setTicksStyle:kTicksLabelsSlanted];
    [_choice[0] setAllAxisLocationXD:1.328];
    [_choice[0] setAllAxisLocationYD:-0.1];
    [axis release];
    [lines release];
    [axisController release];
    [linesController release];
     
    // Autoconfigure the plot choice1.
    _choice[1] = [WSChart linePlotWithFrame:[self.chart frame]
                                       data:testD
                                      style:kChartLineGradient
                                  axisStyle:kCSGrid
                                colorScheme:kColorDark
                                     labelX:NSLocalizedString(@"Crystal orientation", @"")
                                     labelY:NSLocalizedString(@"Energy output", @"")];
    [_choice[1] retain];
    [_choice[1] setAllAxisLocationXD:1.328];
    [_choice[1] setAllAxisLocationYD:-0.1];

    // Autoconfigure the plot choice2.
    _choice[2] = [WSChart linePlotWithFrame:[self.chart frame]
                                       data:testD
                                      style:kChartLineFilled
                                    axisStyle:kCSArrows
                                colorScheme:kColorDarkBlue
                                     labelX:NSLocalizedString(@"Crystal orientation", @"")
                                     labelY:NSLocalizedString(@"Energy output", @"")];
    [_choice[2] retain];
    [_choice[2] setAllAxisLocationXD:1.328];
    [_choice[2] setAllAxisLocationYD:-0.1];

    // Initially display choice[0].
    [self.chart addPlotsFromChart:_choice[0]];
    self.chart.backgroundColor = _choice[0].backgroundColor;
}

- (IBAction)updateChart {
    [self.chart removeAllPlots];
    [self.chart addPlotsFromChart:_choice[self.chooser.selectedSegmentIndex]];
    self.chart.backgroundColor = _choice[self.chooser.selectedSegmentIndex].backgroundColor;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self.chart removeAllPlots];
    self.chart = nil;
    self.chooser = nil;
}


#pragma mark -

@synthesize chart = _chart;
@synthesize chooser = _chooser;

- (void)dealloc {
    self.chart = nil;
    self.chooser = nil;
    [_choice[0] release];
    [_choice[1] release];
    [_choice[2] release];
    
    [super dealloc];
}

@end
