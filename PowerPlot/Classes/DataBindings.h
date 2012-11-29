//
//  DataBindings.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 11/1/11.
//  Copyright (c) 2011 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"
#import "PowerPlot.h"

/// Resolution: Number of data points between [xmin, xmax].
const static NAFloat resolution = 50;

@interface DataBindings : ExampleChartController {
    
@private
    WSData *_sineFunction;
}

@property (nonatomic, retain) IBOutlet WSChart *chart;
@property (nonatomic, retain) IBOutlet UISlider *phaseSlider;
@property (nonatomic, retain) IBOutlet UISlider *factorSlider;
@property (nonatomic, retain) IBOutlet UISlider *offsetSlider;

- (IBAction)sliderDidMove:(id)sender;

@end
