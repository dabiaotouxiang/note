//
//  ViewController.m
//  GetImage
//
//  Created by lsb on 2022/5/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", NSHomeDirectory());
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取图片
    UIImage *image = [UIImage imageNamed:@"My"];
    // 开启图片类型的上下文
//    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
//    UIGraphicsBeginImageContext(CGSizeMake(300,300)); <==>UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300),NO,1);
//    第一个参数 是大小 第二个是是否是不透明的 第三个是图片的缩放 所以直接把屏幕的像素缩放写这就行
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, [UIScreen mainScreen].scale);
    // 获取当前的上下文呢
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 拼接路径 把路径添加到上下文
    CGContextAddArc(ctx, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5, 0, 2 * M_PI, 1);
    // 裁剪
    CGContextClip(ctx);
    // 画图片
    [image drawAtPoint:CGPointZero];
    
    // 通过图片类型的上下文获取图片对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    // 关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    // 把图片放到图片框
    self.imageView.image = newImage;


    // 用NSData存到doc目录下
//    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    NSString *filePath = [docPath stringByAppendingPathComponent:@"xxx.png"];
//
//    NSData *data = UIImagePNGRepresentation(image);
//
//    [data writeToFile:filePath atomically:YES];
    // 这的selector只能 写成这样
    // 必须在info.plist 里面添加 Privacy - Photo Library Additions Usage Description NSString类型，后面写的是保存图片的理由
    // 最后一个参数就是传给selector的contextInfo内容，可以给selector通过contextInfo判断如何进行后面的处理
    //2022-05-29 11:28:06.569846+0800 ClipImage[37827:2030915] [access] This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSPhotoLibraryAddUsageDescription key with a string value explaining to the user how the app uses this data.
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"完成");
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    // 开启图片类型的上下文
////    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
////    UIGraphicsBeginImageContext(CGSizeMake(300,300)); <==>UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300),NO,1);
////    第一个参数 是大小 第二个是是否是不透明的 第三个是图片的缩放 所以直接把屏幕的像素缩放写这就行
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, [UIScreen mainScreen].scale);
//    // 获取当前的上下文呢
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    // 拼接路径 把路径添加到上下文
//    CGContextMoveToPoint(ctx, 50, 50);
//    CGContextAddLineToPoint(ctx, 150, 150);
//
//    // 渲染
//    CGContextStrokePath(ctx);
//
//    // 通过图片类型的上下文获取图片对象
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//
//    // 关闭图片类型的图形上下文
//    UIGraphicsEndImageContext();
//    // 把图片放到图片框
//    self.imageView.image = image;
//
//
//    // 存到doc目录下
//    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    NSString *filePath = [docPath stringByAppendingPathComponent:@"xxx.png"];
//
//    NSData *data = UIImagePNGRepresentation(image);
//
//    [data writeToFile:filePath atomically:YES];
//}

@end
