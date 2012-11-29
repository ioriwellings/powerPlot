//
//  BusinessModelGraph.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "BusinessModelGraph.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation BusinessModelGraph

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the nodes and connections of the graph.
    WSData *graphTest = [DemoData demoGraphNodes];
    WSGraphConnections *connections = [DemoData demoGraphConnections];
    WSGraph *myGraph = [WSGraph graphWithNodes:graphTest
                                   connections:connections];
    
    // Create the chart.
    WSChart *gChart = [WSChart graphPlotWithFrame:[self.view bounds]
                                            graph:myGraph
                                      colorScheme:kColorWhite];

    gChart.autoresizingMask = 63;
    [self.view addSubview:gChart];
}

@end

