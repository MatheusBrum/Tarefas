//
//  MBInput.m
//  MBInputText
//
//  Created by Matheus Brum on 07/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "MBInput.h"
@implementation DimView
- (id)initWithParent:(UIView*) aParentView onTappedSelector:(SEL) tappedSel{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        // Initialization code
        parentView = aParentView;
        onTapped = tappedSel;
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.0;
    }
    return self;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [parentView performSelector:onTapped];
}
- (void)dealloc{
    [super dealloc];
}
@end
@interface MBInput (PrivateMethods)
+ (MBInput*) panel;
@end

@implementation MBInput
@synthesize dimView = _dimView;
@synthesize backgroundGradient = _backgroundGradient;
@synthesize entryField = _entryField;
@synthesize closeBlock = _closeBlock;
+(MBInput*) panel{
    MBInput *panel =  (MBInput*) [[[UINib nibWithNibName:@"MBInput" bundle:nil] 
                                             instantiateWithOwner:self options:nil] objectAtIndex:0];
    panel.backgroundGradient.image = [[UIImage imageNamed:@"TopBar"] stretchableImageWithLeftCapWidth:1 topCapHeight:5];
    CATransition *transition = [CATransition animation];
	transition.duration = kAnimationDuration;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionPush;	
	transition.subtype = kCATransitionFromBottom;
	[panel.layer addAnimation:transition forKey:nil];
    return panel;
}
+(void) showPanelInView:(UIView*)view onTextEntered:(CloseBlock) editingEndedBlock{
    MBInput *panel = [MBInput panel];
    panel.closeBlock = editingEndedBlock;
    [panel.entryField becomeFirstResponder];
    panel.dimView = [[[DimView alloc] initWithParent:panel onTappedSelector:@selector(cancelTapped:)] autorelease];
    CATransition *transition = [CATransition animation];
	transition.duration = kAnimationDuration;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionFade;
	[panel.dimView.layer addAnimation:transition forKey:nil];
    panel.dimView.alpha = 0.8;
    [view addSubview:panel.dimView];
    [view addSubview:panel];
}
- (IBAction) textFieldDidEndOnExit:(UITextField *)textField {
    [self performSelectorOnMainThread:@selector(hidePanel) withObject:nil waitUntilDone:YES];    
}
- (IBAction)Add:(id)sender{
    [self performSelectorOnMainThread:@selector(hidePanel) withObject:nil waitUntilDone:YES];    
    self.closeBlock(self.entryField.text);
}
-(void) cancelTapped:(id) sender{
    [self performSelectorOnMainThread:@selector(hidePanel) withObject:nil waitUntilDone:YES];    
}
-(void) hidePanel{
    [self.entryField resignFirstResponder];
    CATransition *transition = [CATransition animation];
	transition.duration = kAnimationDuration;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionPush;	
	transition.subtype = kCATransitionFromTop;
	[self.layer addAnimation:transition forKey:nil];
    self.frame = CGRectMake(0, -self.frame.size.height, 320, self.frame.size.height); 
    transition = [CATransition animation];
	transition.duration = kAnimationDuration;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionFade;
	self.dimView.alpha = 0.0;
	[self.dimView.layer addAnimation:transition forKey:nil];
    [self.dimView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.40];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.45];
}
- (void)dealloc{
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
@end
