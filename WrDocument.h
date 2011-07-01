//
//  WrDocument.h
//  writy
//
//  Created by Jay Bird on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <Cocoa/Cocoa.h>

@interface WrDocument : NSDocument {
  NSAttributedString* contents;
  NSTextView* textView;
}

@property (assign) IBOutlet NSTextView* textView;
@property (assign) NSAttributedString* contents;

@end
