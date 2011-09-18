//
//  xCode_Keyboard_ShortcutsAppDelegate.h
//  xCode Keyboard Shortcuts
//
//  Created by Matheus Brum on 18/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "GradientView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GradientView

//
// layerClass
//
// returns a CAGradientLayer class as the default layer class for this view
//
+ (Class)layerClass
{
	return [CAGradientLayer class];
}

//
// setupGradientLayer
//
// Construct the gradient for either construction method
//
- (void)setupGradientLayer
{
	CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
	gradientLayer.colors =
    [NSArray arrayWithObjects:
     (id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor,
     (id)[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor,
     nil];
	self.backgroundColor = [UIColor clearColor];
}

//
// initWithFrame:
//
// Initialise the view.
//
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
	if (self)
	{
		CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
		gradientLayer.colors =
        [NSArray arrayWithObjects:
         (id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor,
         (id)[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0].CGColor,
         nil];
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
