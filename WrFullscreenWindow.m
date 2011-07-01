//
//  WrFullscreenWindow.m
//  writy
//
//  Created by Jay Bird on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WrFullscreenWindow.h"


@implementation WrFullscreenWindow

- (BOOL) canBecomeKeyWindow {
	return YES;
}

- (NSTimeInterval)animationResizeTime:(NSRect)newFrame {
	return 0.2;
}

@end
