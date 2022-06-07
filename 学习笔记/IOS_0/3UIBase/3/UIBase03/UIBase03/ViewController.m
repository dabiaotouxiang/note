//
//  ViewController.m
//  UIBase03
//
//  Created by lsb on 2022/5/16.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppIconDownload.h"
@interface ViewController ()
@property(nonatomic, strong) NSArray* picArray;

@end

@implementation ViewController

- (NSArray *)picArray{
    if (_picArray == nil){
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"]];
        NSMutableArray *picModels = [NSMutableArray new];
        for (int i = 0; i < dictArray.count ; i++){
            AppInfo *appInfo = [AppInfo appWithDict:dictArray[i]];
            [picModels addObject:appInfo];
        }
        _picArray = picModels;
    }
    return _picArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    int numInLine = 3;
    CGFloat marginTop = 50;
    CGFloat marginX = (self.view.frame.size.width - (numInLine * 60))/(numInLine + 1);
    CGFloat marginY = marginX;
    
    for (int i = 0; i< self.picArray.count ; i ++){
        AppIconDownload *app = [AppIconDownload appIconDownload];
        app.model = self.picArray[i];
        
        CGFloat frameX = marginX * ((i % numInLine) + 1) + app.frame.size.width * (i % numInLine);
        CGFloat frameY = marginTop + (app.frame.size.height + marginY) * (i / numInLine);
        
        CGRect frame = CGRectMake(frameX, frameY, app.frame.size.width, app.frame.size.height);
        app.frame = frame;
        
        [self.view addSubview:app];
        
    }
}


@end
