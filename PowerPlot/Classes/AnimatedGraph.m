//
//  AnimatedGraph.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/7/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "AnimatedGraph.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation AnimatedGraph

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the chart with a single line plot.
    if (_sineFunction == nil) {
        _sineFunction = [WSData new];
    }
    const CGFloat resolution = 50;
    [DemoData sineFunctionWithData:_sineFunction
                              xmin:0.
                              xmax:8.
                            factor:1.
                             phase:0.
                            offset:0.
                        resolution:resolution];
    self.chart = [WSChart linePlotWithFrame:[self.view bounds]
                                       data:_sineFunction
                                      style:kChartLineGradient
                                  axisStyle:kCSGrid
                                colorScheme:kColorDark
                                     labelX:NSLocalizedString(@"x", @"")
                                     labelY:NSLocalizedString(@"o+f*sin(x+p)", @"")];
    [self.chart setChartTitle:NSLocalizedString(@"Sine function", @"")];
    
    self.chart.autoresizingMask = 63;
    [self.view addSubview:self.chart];

#ifdef __IPHONE_4_0
    // Setup the animation.
    [self.chart dataAnimateWithDuration:5
                                  delay:2
                                options:kWSChartAnimationOptionCurveEaseInOut
                             animations:^{
                                 [DemoData sineFunctionWithData:_sineFunction
                                                           xmin:0.
                                                           xmax:8.
                                                         factor:1.5
                                                          phase:0.5
                                                         offset:1.
                                                     resolution:resolution];
                             }
                                context:NULL
                                 update:^(CGFloat progress, id customData) {
                                     NSLog(@"This is update: %f!", progress);
                                 }
                             completion:^(BOOL completion){
                                 NSLog(@"This is completion: %d!", completion);
                             }];
#endif
}


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
