//
//  WrDocument.m
//  writy
//
//  Created by Jay Bird on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WrDocument.h"

const CGFloat LargeNumberForText = 1.0e7;

@implementation WrDocument

@synthesize textView, contents;

- (id)init {
  self = [super init];
  if (self) {
    contents = [[NSAttributedString alloc] init];
  }
  return self;
}

- (NSString *)windowNibName {
  return @"WrDocument";
}

- (void)setNoWrap {
	NSScrollView* scrollView = [textView enclosingScrollView];
	NSTextContainer* textContainer = [textView textContainer];
	[scrollView setHasVerticalScroller:YES];
	[scrollView setHasHorizontalScroller:YES];
	[scrollView setAutohidesScrollers:YES];
	[scrollView setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
	[textContainer setWidthTracksTextView:NO];
  [textContainer setHeightTracksTextView:NO];
	[textContainer setContainerSize:NSMakeSize(LargeNumberForText, LargeNumberForText)];
	[textView setHorizontallyResizable:YES];
  [textView setVerticallyResizable:YES];
  [textView setAutoresizingMask:NSViewNotSizable];
	[textView setMaxSize:NSMakeSize(LargeNumberForText, LargeNumberForText)];
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController {
  [super windowControllerDidLoadNib:aController];
  [[aController window] setBackgroundColor:[NSColor whiteColor]];
  [self setNoWrap];
  [[textView textStorage] setAttributedString:contents];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
  // Insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil.

  // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

  // For applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.

  if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
  BOOL readSuccess = NO;
  NSAttributedString* fileContents = [[NSAttributedString alloc]
                                      initWithData:data
                                      options:nil
                                      documentAttributes:nil
                                      error:outError];
  if (fileContents) {
    readSuccess = YES;
    [contents release];
    contents = fileContents;
  }
  return readSuccess;
}

@end
