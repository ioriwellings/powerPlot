//
//  WebsiteVisitor.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 22.11.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "WebsiteVisitor.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation WebsiteVisitor

- (void)viewDidLoad {
    [super viewDidLoad];

    // One update step, then we are done.
    [self switchStyle];
}

- (void)switchStyle {
    
    // Create and configure the bar chart.
    WSData *hitsD = [DemoData monthlyHits];
    WSData *pageViews = [DemoData monthlyPageviews];
    WSData *pageVisitors = [DemoData monthlyVisitors];
    BPStyle chosenStyle = [self.styleSelector selectedSegmentIndex] + 1;
    WSChart *barChart = [WSChart multiBarPlotWithFrame:[self.visitors frame]
                                                  data:[NSArray arrayWithObjects:hitsD,
                                                        pageViews, pageVisitors, nil]
                                                 style:chosenStyle
                                           colorScheme:kColorWhite];
    [barChart scaleAllAxisYD:NARangeMake(-30000, 1.2*[hitsD maximumValue])];
    [barChart setAllAxisLocationYD:0];
    WSPlotAxis *axis = [barChart firstPlotAxis];
    [[axis ticksY] ticksWithNumbers:[NSArray arrayWithObjects:
                                     [NSNumber numberWithFloat:20000],
                                     [NSNumber numberWithFloat:40000],
                                     [NSNumber numberWithFloat:60000],
                                     [NSNumber numberWithFloat:80000],
                                     [NSNumber numberWithFloat:100000],
                                     nil]
                             labels:[NSArray arrayWithObjects:@"20k", @"40k",
                                     @"60k", @"80k", @"100k", nil]];

    // Add the chart and redisplay.
    [self.visitors removeAllPlots];
    [self.visitors addPlotsFromChart:barChart];
    [self.visitors setChartTitle:NSLocalizedString(@"Field-theory.org web traffic", @"")];
    [self.visitors setNeedsDisplay];
}


#pragma mark -

@synthesize visitors = _visitors;
@synthesize styleSelector = _styleSelector;

- (void)viewDidUnload {
    [super viewDidUnload];
    [self.visitors removeAllPlots];
    self.visitors = nil;
    self.styleSelector = nil;
}

- (void)dealloc {
    self.visitors = nil;
    self.styleSelector = nil;
    [super dealloc];
}

@end
