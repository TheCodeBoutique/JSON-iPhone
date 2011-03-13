//
//  LuckyNumbersViewController.m
//  LuckyNumbers
//
//  Created by Kyle Carriedo on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LuckyNumbersViewController.h"
#import "JSON.h"

@implementation LuckyNumbersViewController




- (void)viewDidLoad {
	[super viewDidLoad];
	
	responseData = [[NSMutableData data] retain];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.unpossible.com/misc/lucky_numbers.json"]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}
// we recieved call from server
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}
//data is loaded from server

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

// this is called if server call us rejected
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	label.text = [NSString stringWithFormat:@"Connection failed: %@", [error description]];
}
// data is loaded from server
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[responseData release];
	
	NSArray *luckyNumbers = [responseString JSONValue];
	
	NSMutableString *text = [NSMutableString stringWithString:@"Lucky numbers:\n"];
	
	for (int i = 0; i < [luckyNumbers count]; i++)
		[text appendFormat:@"%@\n", [luckyNumbers objectAtIndex:i]];
	
	label.text =  text;
}



- (void)dealloc {
    [super dealloc];
}

@end
