//
//  WebsiteVisitor.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 22.11.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"

@class WSChart;

@interface WebsiteVisitor : ExampleChartController

@property (nonatomic, retain) IBOutlet WSChart *visitors;
@property (nonatomic, retain) IBOutlet UISegmentedControl *styleSelector;

- (IBAction)switchStyle;

@end
