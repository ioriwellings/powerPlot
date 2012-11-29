///
///  @file
///  WSDiscProperties.m
///  PowerPlot
///
///  Created by Wolfram Schroers on 1/22/12.
///  Copyright (c) 2012 Numerik & Analyse Schroers. All rights reserved.
///

#import "WSDiscProperties.h"


@implementation WSDiscProperties

@synthesize lineWidth = _lineWidth;
@synthesize lineColor = _lineColor;
@synthesize fillColor = _fillColor;
@synthesize discStyle = _discStyle;


- (void)dealloc {
    [_lineColor release];
    [_fillColor release];
    _lineColor = nil;
    _fillColor = nil;
    
    [super dealloc];
}

@end
