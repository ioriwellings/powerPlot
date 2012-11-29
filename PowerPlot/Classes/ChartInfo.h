//
//  ChartInfo.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChartInfo : NSObject

/** A chart controller, handling the view of a WSChart object. */
@property (nonatomic, retain) UIViewController *chartController;

/** The name of a plot associated with the WSChart object. */
@property (nonatomic, copy) NSString *chartName;

/** The description of a plot associated with the WSChart object. */
@property (nonatomic, copy) NSString *chartDescription;

/** Factory method for an autoreleased instance of ChartInfo. */
+ (id)chartInfoWithController:(UIViewController *)controller
                         name:(NSString *)name
                  description:(NSString *)desc;

/** Initialize a single instance of chart information. */
- (id)initWithController:(UIViewController *)controller
                    name:(NSString *)name
             description:(NSString *)desc;

@end
