//
//  DataHandling.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"

@interface DataHandling : ExampleChartController

@property (nonatomic, retain) IBOutlet UITextView *inputData;
@property (nonatomic, retain) IBOutlet UITextView *reportData;

/** Run the tests, triggered by pressing the button. */
- (IBAction)runTests;

@end
