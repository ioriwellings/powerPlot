///
///  @file
///  WSFont.m
///  PowerPlot
///
///  Created by Wolfram Schroers on 28.10.10.
///  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
///

#import "WSFont.h"


#if __IPHONE_OS_VERSION_MAX_ALLOWED < 60000

@implementation UIFont (WSFont)


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[UIFont fontWithName:[self fontName]
                            size:[self pointSize]] retain];
}

@end

#endif
