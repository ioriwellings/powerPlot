//
//  AnimatedGraph.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/7/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"

@class WSData;
@class WSChart;

@interface AnimatedGraph : ExampleChartController {

@private
    WSData *_sineFunction;
}

@property (nonatomic, retain) IBOutlet WSChart *chart;

@end
