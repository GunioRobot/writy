//
//  WrAppDelegate.h
//  writy
//
//  Created by Jay Bird on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface WrAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow* normalWindow;
	NSWindow* fullscreenWindow;
}

- (IBAction)toggleFullscreen:(id)sender;
- (void)goToFullScreen;
- (void)goToNormalWindow;

@property (assign) NSWindow* normalWindow;

@end
