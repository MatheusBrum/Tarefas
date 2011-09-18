//
//  MBInput.h
//  MBInputText
//  INSPIRADO POR https://github.com/MugunthKumar/MKEntryPanelDemo
//  Created by Matheus Brum on 07/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#define kAnimationDuration 0.35
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

typedef void (^CloseBlock)(NSString *inputString);

@interface DimView : UIView {
    
    SEL onTapped;
    UIView *parentView;
}
- (id)initWithParent:(UIView*) aParentView onTappedSelector:(SEL) tappedSel;

@end
@interface MBInput : UIView{
    CloseBlock _closeBlock;

    DimView *_dimView;
    UITextField *_entryField;
    UIImageView *_backgroundGradient;

}
@property (nonatomic, copy) CloseBlock closeBlock;
@property (nonatomic, assign) DimView *dimView;
@property (nonatomic, assign) IBOutlet UITextField *entryField;
@property (nonatomic, assign) IBOutlet UIImageView *backgroundGradient;
+(void) showPanelInView:(UIView*)view onTextEntered:(CloseBlock) editingEndedBlock;
- (IBAction) textFieldDidEndOnExit:(UITextField *)textField;
- (IBAction)Add:(id)sender;
@end
