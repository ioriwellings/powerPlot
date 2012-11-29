//
//  ChartInfo.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ChartInfo.h"

@implementation ChartInfo

@synthesize chartController = _chartController;
@synthesize chartName = _chartName;
@synthesize chartDescription = _chartDescription;


+ (id)chartInfoWithController:(UIViewController *)controller
                         name:(NSString *)name
                  description:(NSString *)desc {
    return [[[self alloc] initWithController:controller
                                        name:name
                                 description:desc]
            autorelease];
}

- (id)initWithController:(UIViewController *)controller
                    name:(NSString *)name
             description:(NSString *)description {
    self = [super init];
    if (self) {
        self.chartController = controller;
        self.chartName = NSLocalizedString(name, @"");
        self.chartDescription = NSLocalizedString(description, @"");
    }
    return self;
}

- (void)dealloc {
    self.chartController = nil;
    self.chartName = nil;
    self.chartDescription = nil;
    [super dealloc];
}

@end
