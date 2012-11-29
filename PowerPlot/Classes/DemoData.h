//
//  DemoData.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import <Foundation/Foundation.h>


@class WSData;
@class WSGraphConnections;


/// The demonstration data used by the PowerPlot demo app.

@interface DemoData : NSObject

/** Return a set of nodes for the demo graph. */
+ (WSData *)demoGraphNodes;

/** Return a set of connections for the demo graph. */
+ (WSGraphConnections *)demoGraphConnections;

/** Return the German Federal Election 2009 results. */
+ (WSData *)electionResults2009;

/** Return a scientific data set with uncertainties. */
+ (WSData *)scientificData;

/** Return the numbers of failed banks from 2000 to 2010. */
+ (WSData *)failedBanks;

/** Return the set of nodes for the second demo graph - Creating value. */
+ (WSData *)valueGraphNodes;

/** Return the set of connections for the second demo graph - Creating value. */
+ (WSGraphConnections *)valueGraphConnections;

/** Return the monthly hits on field-theory.org. */
+ (WSData *)monthlyHits;

/** Return the monthly pageviews on field-theory.org. */
+ (WSData *)monthlyPageviews;

/** Return the monthly unique visitors on field-theory.org. */
+ (WSData *)monthlyVisitors;

/** Return a set of scattered points around the center. */
+ (WSData *)scatteredPoints;

/** Return a region around the center. */
+ (WSData *)centerRegion;

/** Return a wider region around the center. */
+ (WSData *)centerRegionWide;

/** Return a measured form factor data set. */
+ (WSData *)formFactorMeasured;

/** Return a fit curve with uncertainties to the form factor data set. */
+ (WSData *)formFactorFit;

/** Return a set with fictional stock data. */
+ (WSData *)stocks1;

/** Return another set with fictional stock data. */
+ (WSData *)stocks2;

/** Return another set with fictional stock data. */
+ (WSData *)stocks3;

/** Return another set with fictional stock data. */
+ (WSData *)stocks4;

/** @brief Modify data to  a sine function.
 
    The input data set is modified to contain a sine function with
    phase and overall multiplicative factor.
 */
+ (void)sineFunctionWithData:(WSData *)data
                        xmin:(CGFloat)xmin
                        xmax:(CGFloat)xmax
                      factor:(CGFloat)factor
                       phase:(CGFloat)phase
                      offset:(CGFloat)offset
                  resolution:(CGFloat)resolution;

/** @brief Total cost and net profit for a software project in two scenarios.
 
    One scenario is a "bad" scenario with high cost and low
    profits. The other is a "good" scenario with low cost and high
    profits.
 */
+ (WSData *)projectCostBad;
+ (WSData *)totalProfitBad;

+ (WSData *)projectCostGood;
+ (WSData *)totalProfitGood;

@end
