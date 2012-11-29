//
//  CreateValue.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 27.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "CreateValue.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation CreateValue

- (void)viewDidLoad {
    [super viewDidLoad];

    // Get the nodes and connections of the graph.
    WSData *graphTest = [DemoData valueGraphNodes];
    WSGraphConnections *connections = [DemoData valueGraphConnections];
    WSGraph *myGraph = [WSGraph graphWithNodes:graphTest
                                   connections:connections];
    
    // Create the chart.
    WSChart *gChart = [WSChart graphPlotWithFrame:[self.view bounds]
                                            graph:myGraph
                                      colorScheme:kColorDark];
    WSPlotGraph *graph = (WSPlotGraph *)[[gChart plotAtIndex:0] view];
    [[graph propDefault] setShadowEnabled:YES];
    [[graph propDefault] setOutlineStroke:0];
    [graph setStyle:kCustomStyleIndividual];
    [graph distributeDefaultPropertiesToAllCustomDatum];
    [(WSNodeProperties *)[[graphTest datumAtIndex:0] customDatum] setNodeColor:[UIColor darkGrayColor]];
    [(WSNodeProperties *)[[graphTest datumAtIndex:3] customDatum] setNodeColor:[UIColor darkGrayColor]];
    [(WSNodeProperties *)[[graphTest datumAtIndex:5] customDatum] setNodeColor:[UIColor redColor]];
    [(WSNodeProperties *)[[graphTest datumAtIndex:6] customDatum] setNodeColor:[UIColor CSSColorGreen]];
    [(WSNodeProperties *)[[graphTest datumAtIndex:6] customDatum] setSize:CGSizeMake(200, 40)];

    gChart.autoresizingMask = 63;
    [self.view addSubview:gChart];
}

@end

