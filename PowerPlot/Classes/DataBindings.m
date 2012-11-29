//
//  DataBindings.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/1/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "DataBindings.h"
#import "DemoData.h"

@implementation DataBindings

- (void)viewDidLoad
{
    [super viewDidLoad];

    // The input data is a sine function with given phase, overall scale
    // and offset.
    // It is stored in the instance variable "_sineFunction" and computed
    // in "sliderDidMove:".
    if (_sineFunction == nil) {
        _sineFunction = [WSData new];
        [DemoData sineFunctionWithData:_sineFunction
                                  xmin:0.
                                  xmax:8.
                                factor:1.
                                 phase:1.
                                offset:0.5
                            resolution:resolution];
    }
    
    // Add a chart with a single line plot.
    WSChart *lineChart = [WSChart linePlotWithFrame:[self.chart frame]
                                               data:_sineFunction
                                              style:kChartLineGradient
                                          axisStyle:kCSGrid
                                        colorScheme:kColorDark
                                             labelX:NSLocalizedString(@"x", @"")
                                             labelY:NSLocalizedString(@"o+f*sin(x+p)", @"")];
    [self.chart removeAllPlots];
    [self.chart addPlotsFromChart:lineChart];
    self.chart.backgroundColor = lineChart.backgroundColor;

    // Activate data bindings for the lines plot.
    [self.chart plotAtIndex:1].bindingsEnabled = YES;
}

- (void)sliderDidMove:(id)sender {
    NAFloat xmin = [_sineFunction minimumValueX];
    NAFloat xmax = [_sineFunction maximumValueX];
    NAFloat phase = [self.phaseSlider value];
    NAFloat factor = [self.factorSlider value];
    NAFloat offset = [self.offsetSlider value];
    
    [DemoData sineFunctionWithData:_sineFunction
                              xmin:xmin
                              xmax:xmax
                            factor:factor
                             phase:phase
                            offset:offset
                        resolution:resolution];
}


#pragma mark -

@synthesize chart = _chart;
@synthesize phaseSlider = _phaseSlider;
@synthesize factorSlider = _factorSlider;
@synthesize offsetSlider = _offsetSlider;

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.chart removeAllPlots];
    self.chart = nil;
    self.phaseSlider = nil;
    self.factorSlider = nil;
    self.offsetSlider = nil;
}

- (void)dealloc
{
    self.chart = nil;
    self.phaseSlider = nil;
    self.factorSlider = nil;
    self.offsetSlider = nil;
    [_sineFunction release];
    _sineFunction = nil;
    
    [super dealloc];
}

@end
