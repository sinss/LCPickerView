![Platform](https://img.shields.io/badge/platform-iOS-green.svg)
![License](https://img.shields.io/badge/License-MIT%20License-orange.svg)

LCPickerView
============

a simple PickerView

how to use : 

```objective-c
#import "LCTableViewPickerControl.h"

LCTableViewPickerControl *pickerView = [[LCTableViewPickerControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, kPickerControlWidth, kPickerControlAgeHeight) title:@"Please pick an item" value:_pickValue items:@[@"item1",@"item2",@"item3",@"item4",@"item5",@"item6"]];
    [pickerView setTag:1];
    
    [self.view addSubview:pickerView];
    
    [pickerView showInView:self.view block:^(id sender, id item) {
        LCTableViewPickerControl *view = (LCTableViewPickerControl*)sender;
        if (view.tag == 1)
        {
            if ([item isKindOfClass:[NSString class]])
            {
                NSLog(@"pick a string : %@", item);
            }
            else if ([item isKindOfClass:[NSNumber class]])
            {
                NSLog(@"pick a number : %@", item);
            }
            
            //do your job here
        }
        [view dismiss];
    }];

```

======================================================================

The MIT License (MIT)

Copyright (c) [2013] [Leo Chang]

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
