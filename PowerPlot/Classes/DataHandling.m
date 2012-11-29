//
//  DataHandling.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "DataHandling.h"
#import "DemoData.h"
#import "PowerPlot.h"

@implementation DataHandling

@synthesize inputData = _inputData;
@synthesize reportData = _reportData;

- (IBAction)runTests {

    // The graph for "A business model".
    WSData *graphTest = [DemoData demoGraphNodes];
    WSGraphConnections *connections = [DemoData demoGraphConnections];
    
    
    // Data for the "Election results".
    WSData *electionD = [DemoData electionResults2009];
    WSData *barData = [electionD indexedData];
    WSData *binned = [WSBinning binWithData:barData
                                  binNumber:5
                                   selector:@selector(value)
                                      range:NARangeMake(0.0, 50.0)];
    
    WSData *scientificData = [DemoData scientificData];
    
#ifdef __IPHONE_4_0
    // Test the application of "map" on WSData objects.
    WSData *mapData1 = [WSData data:scientificData
                                map:^WSDatum *(const id datum) {
                                    WSDatum *newDatum = [datum copy];
                                    [newDatum setValue:2.0*[(WSDatum *)datum value]];
                                    
                                    return [newDatum autorelease];
                                }];
    WSData *mapData2 = [WSData data:[NSArray arrayWithObjects:scientificData,
                                     mapData1, nil]
                                map:^WSDatum *(const id iData) {
                                    WSDatum *val1 = [iData objectAtIndex:0];
                                    WSDatum *val2 = [iData objectAtIndex:1];
                                    WSDatum *newDatum = [WSDatum datum];
                                    [newDatum setValue:([val1 value] +
                                                        [val2 value])];
                                    [newDatum setValueX:[val1 valueX]];
                                    
                                    return newDatum;
                                }];
    WSData *sort2 = [mapData2 sortedDataUsingComparator:^NSComparisonResult(WSDatum *val1,
                                                                            WSDatum *val2) {
        if ([val1 valueX] < [val2 valueX]) {
            return NSOrderedAscending;
        } else if ([val1 valueX] > [val2 valueX]) {
            return NSOrderedDescending;
        }

        return NSOrderedSame;
    }];
    NAFloat redAv = [[scientificData reduceAverage] value];
    NAFloat redSum = [[scientificData reduceSum] value];
#endif
    
    // Test the line-rectangle intersection.
    CGPoint test = NALineInternalRectangleIntersection(CGPointMake(5.0, 2.0), 
                                                       CGPointMake(0.0, 3.0), 
                                                       CGRectMake(1.0, 1.0, 10.0, 10.0));
    
    // Log results.
    _inputData.text = [NSString stringWithFormat:NSLocalizedString(@"Data for \"A business model\""
                       @":\ngraphTest: %@\nconnections: %@\n\nelectionD: %@\n", @""),
                       [graphTest description],
                       [connections description],
                       [electionD description]];
    _reportData.text = [NSString stringWithFormat:NSLocalizedString(@"electionD binning result: %@"
                        @"\n\nLine->Rectangle intersection point: (%e,%e)"
                        @"\n\nScientific data representation: %@\n"
#ifdef __IPHONE_4_0
                        @"\n\nTransformation 1 on scientific data: %@\n"
                        @"\n\nTransformation 2 on scientific data: %@\n"
                        @"\n\nSorting transformation 2 by X-values: %@\n"
                        @"\n\nReduction 'average' on scientific data: %e\n"
                        @"\n\nReduction 'sum' on scientific data: %e\n"
#endif
                       , @""),
                       [binned description],
                       test.x, test.y,
                       scientificData
#ifdef __IPHONE_4_0
                       ,
                       mapData1,
                       mapData2,
                       sort2,
                       redAv,
                       redSum
#endif
                       ];
}


#pragma mark -

- (void)viewDidUnload {
    [super viewDidUnload];
    self.inputData = nil;
    self.reportData = nil;
}

- (void)dealloc {
    [_inputData release];
    [_reportData release];
    _inputData = nil;
    _reportData = nil;
    
    [super dealloc];
}

@end
