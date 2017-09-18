// Created by EthanRDoesMC - Inspired by TranslucentCydia - Soon-to-be systemwide.

#import <UIKit/UIKit.h>

NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:
                                    [NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"tk.ethanrdoesmc.translucencyprefs.plist"]];
    NSNumber* active = [settings objectForKey:@"active"];
	NSNumber* allui = [settings objectForKey:@"beta"];
	NSNumber* install = [settings objectForKey:@"logview"];
	NSNumber* home = [settings objectForKey:@"homeview"];
	NSNumber* except = [settings objectForKey:@"allothers"];	
		
// if ([request.URL.absoluteString rangeOfString:URL].length != 0

static NSString *logiPhone = @"cydia.saurik.com/ui/ios~iphone/1.1/progress";

static NSString *logiPad = @"cydia.saurik.com/ui/ios~ipad/1.1/progress";

static NSString *homeiPhone = @"cydia.saurik.com/ui/ios~iphone/1.1/home";

static NSString *homeiPad = @"cydia.saurik.com/ui/ios~ipad/1.1/home";

@interface UIWebBrowserView : UIView
- (NSURL *)_documentUrl;
@end

@interface _UIWebViewScrollView : UIView
@end

@interface UIApplication (Private)
- (void)_setBackgroundStyle:(long long)style;
@end

%hook UIWebBrowserView
- (void)loadRequest:(NSURLRequest *)request {
    %orig;
    if ([active boolValue] == YES)
			{
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }
	if ([install boolValue] == YES) {
	if ([request.URL.absoluteString rangeOfString:logiPhone].length != 0 || [request.URL.absoluteString rangeOfString:logiPad].length != 0)
		{
		[[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
						 }
						 }
	if ([home boolValue] == YES) {
	if ([request.URL.absoluteString rangeOfString:homeiPhone].length != 0 || [request.URL.absoluteString rangeOfString:homeiPad].length != 0)
		{
		[[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
					 }
					 }
	if ([except boolValue] == YES) {
	if (!([request.URL.absoluteString rangeOfString:homeiPhone].length != 0 || [request.URL.absoluteString rangeOfString:homeiPad].length != 0 || [request.URL.absoluteString rangeOfString:logiPhone].length != 0 || [request.URL.absoluteString rangeOfString:logiPad].length != 0))
		{
		[[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
						 }
}
}
%end

%hook UIView
- (void) _didScroll {
    %orig;
    if ([allui boolValue] == YES)
			{
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }
}
%end	
	
%hook _UIWebViewScrollView
- (void)setBackgroundColor:(UIColor *)color {
    for (UIWebBrowserView *view in self.subviews) {
        if ([view isKindOfClass:%c(UIWebBrowserView)]) {
			if ([active boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
		}
		}
    %orig;
}
%end

%hook UIScrollView
- (void)setBackgroundColor:(UIColor *)color {
    for (UIView *view in self.subviews) {
        if ([allui boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
		}
    %orig;
}
%end