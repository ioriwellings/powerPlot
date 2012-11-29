//
//  MixedAnimation.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/15/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "MixedAnimation.h"
#import "DemoData.h"

/// Duration of the animation (in seconds).
const static NAFloat duration = 2;

@implementation MixedAnimation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // We have two data sets: project cost and net profits.
    self.current = 0;
    self.projectCost = [DemoData projectCostBad];
    self.totalProfit = [DemoData totalProfitBad];
    
    // Create and configure the bar chart with the project cost.
    WSChart *barChart = [WSChart barPlotWithFrame:[self.chart frame]
                                             data:self.projectCost
                                            style:kChartBarPlain
                                      colorScheme:kColorLight];
    WSPlotAxis *axis = [barChart firstPlotAxis];
    [barChart scaleAllAxisYD:NARangeMake(-50, 200)];
    [barChart setAllAxisLocationYD:0.];
    [axis setTicksXDWithData:self.projectCost];
    [axis autoTicksYD];
    [axis.ticksX setTickLabelsWithStyle:NSNumberFormatterNoStyle];
    [axis.ticksY setTickLabelsWithStyle:NSNumberFormatterNoStyle];
    WSPlotBar *barPlot = [barChart firstPlotOfClass:[WSPlotBar class]];
    WSBarProperties *barDefault = (WSBarProperties *)[barPlot propDefault];
    [barDefault setOutlineColor:[UIColor darkGrayColor]];
    [barDefault setBarColor:[UIColor darkGrayColor]];
    [barDefault setBarColor2:[UIColor redColor]];
    [barDefault setStyle:kBarGradient];
    
    // Add the line chart with the net profits.
    [barChart generateControllerWithData:self.totalProfit
                               plotClass:[WSPlotData class]
                                   frame:[self.chart frame]];
    WSPlotData *linePlot = [barChart firstPlotOfClass:[WSPlotData class]];
    linePlot.propDefault.symbolStyle = kSymbolNone;
    linePlot.lineWidth = 3;
    
    [self.chart addPlotsFromChart:barChart];
}

- (void)toggleSwitch:(UISegmentedControl *)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            // Bad scenario.
            [self badScenario];
            break;
            
        case 1:
            // Good scenario.
            [self goodScenario];
            break;
            
        default:
            break;
    }
}

- (void)goodScenario
{
#ifdef __IPHONE_4_0
    if (self.chart.animationTimer != nil) {
        [self.aSwitch setSelectedSegmentIndex:self.current];
        return;
    } else {
        [self.chart dataAnimateWithDuration:duration
                                 animations:^{
                                     [[self.chart plotAtIndex:0] setDataD:[DemoData projectCostGood]];
                                     [[self.chart plotAtIndex:2] setDataD:[DemoData totalProfitGood]];
                                 }];
        self.current = 1;
    }
#endif
}

- (void)badScenario
{
#ifdef __IPHONE_4_0
    if (self.chart.animationTimer != nil) {
        [self.aSwitch setSelectedSegmentIndex:self.current];
    } else {
        [self.chart dataAnimateWithDuration:duration
                                 animations:^{
                                     [[self.chart plotAtIndex:0] setDataD:[DemoData projectCostBad]];
                                     [[self.chart plotAtIndex:2] setDataD:[DemoData totalProfitBad]];
                                 }];
        self.current = 0;
    }
#endif
}


#pragma mark -

@synthesize chart = _chart;
@synthesize aSwitch = _aSwitch;
@synthesize projectCost = _projectCost;
@synthesize totalProfit = _totalProfit;
@synthesize current = _current;

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.chart = nil;
    self.aSwitch = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.chart resetChart];
}

- (void)dealloc {
    self.chart = nil;
    self.aSwitch = nil;
    
    [super dealloc];
}

@end
