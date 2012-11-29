//
//  BusinessModelGraphInteractive.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "BusinessModelGraphInteractive.h"
#import "DemoData.h"
#import "PowerPlot.h"

@interface BusinessModelGraphInteractive ()

// Label that displays the currently selected node.
@property (nonatomic, strong) UILabel *selection;

// Callback when a tap is received.
- (void)userDidTap:(UITapGestureRecognizer *)sender;

@end

@implementation BusinessModelGraphInteractive

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

    // Manually add a gesture recognizer.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(userDidTap:)];
    [gChart addGestureRecognizer:tapRecognizer];
    
    // Finally, add a label that displays the current choice.
    self.selection = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                               gChart.frame.size.width, 30)];
    self.selection.backgroundColor = [UIColor clearColor];
    self.selection.text = @"No tap received yet.";
    
    gChart.autoresizingMask = 63;
    self.selection.autoresizingMask = 63;
    [self.view addSubview:gChart];
    [self.view addSubview:self.selection];
}

- (void)userDidTap:(UITapGestureRecognizer *)sender
{
    WSPlotGraph *graph = (WSPlotGraph *)[[(WSChart *)sender.view plotAtIndex:0] view];
    CGPoint tap = [sender locationInView:sender.view];
    NSInteger nodeNum = [graph nodeForPoint:tap];
    if (nodeNum > -1) {
        // User tapped on a node.
        WSDatum *node = [[DemoData demoGraphNodes] datumAtIndex:nodeNum];
        self.selection.text = [NSString stringWithFormat:@"Tap on: %@.",
                               node.annotation];
    } else {
        // User tapped elsewhere.
        self.selection.text = @"Tap outside of nodes.";
    }
}

@end

