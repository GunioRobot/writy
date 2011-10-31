//
//  WrAppDelegate.m
//  writy
//
//  Created by Jay Bird on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WrAppDelegate.h"
#import "WrFullscreenWindow.h"

@implementation WrAppDelegate

@synthesize normalWindow;

- (IBAction)toggleFullscreen:(id)sender {
	if (fullscreenWindow) {
		[self goToNormalWindow];
	} else {
		[self goToFullScreen];
	}
}

- (void)goToNormalWindow {
	NSRect newFrame = [fullscreenWindow frameRectForContentRect:
                     [normalWindow contentRectForFrameRect:[normalWindow frame]]];
	[fullscreenWindow
	 setFrame:newFrame
	 display:YES
	 animate:YES];

	NSView* contentView = [[[fullscreenWindow contentView] retain] autorelease];
	[fullscreenWindow setContentView:[[[NSView alloc] init] autorelease]];

	[normalWindow setContentView:contentView];
	[normalWindow makeKeyAndOrderFront:nil];

	[fullscreenWindow close];
	fullscreenWindow = nil;

	if ([[normalWindow screen] isEqual:[[NSScreen screens] objectAtIndex:0]]) {
		[NSMenu setMenuBarVisible:YES];
	}
  normalWindow = nil;
}

- (void)goToFullScreen {
  normalWindow = [NSApp keyWindow];
  if (normalWindow == nil) return;
	if ([[normalWindow screen] isEqual:[[NSScreen screens] objectAtIndex:0]]) {
		[NSMenu setMenuBarVisible:NO];
	}

	[normalWindow orderOut:nil];

	fullscreenWindow = [[WrFullscreenWindow alloc]
                      initWithContentRect:[normalWindow contentRectForFrameRect:[normalWindow frame]]
                      styleMask:NSBorderlessWindowMask
                      backing:NSBackingStoreBuffered
                      defer:YES
                      screen:[normalWindow screen]];

	NSView *contentView = [[[normalWindow contentView] retain] autorelease];
	[normalWindow setContentView:[[[NSView alloc] init] autorelease]];

	[fullscreenWindow setHidesOnDeactivate:YES];
	[fullscreenWindow setLevel:NSFloatingWindowLevel];
	[fullscreenWindow setContentView:contentView];
	[fullscreenWindow setTitle:[normalWindow title]];
	[fullscreenWindow makeKeyAndOrderFront:nil];
	[fullscreenWindow setBackgroundColor:[NSColor whiteColor]];

	[fullscreenWindow
	 setFrame:
	 [fullscreenWindow
	  frameRectForContentRect:[[fullscreenWindow screen] frame]]
	 display:YES
	 animate:YES];
}

@end
