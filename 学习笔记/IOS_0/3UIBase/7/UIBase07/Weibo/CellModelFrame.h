//
//  CellModelFrame.h
//  Weibo
//
//  Created by lsb on 2022/5/22.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CellModelFrame : NSObject

@property(nonatomic, assign, readonly) CGRect textFrame;
@property(nonatomic, assign, readonly) CGRect iconFrame;
@property(nonatomic, assign, readonly) CGRect nameFrame;
@property(nonatomic, assign, readonly) CGRect pictureFrame;
@property(nonatomic, assign, readonly) CGRect vipFrame;
@property(nonatomic, assign, readonly) int cellHeight;

@property(nonatomic, strong) CellModel *cellModel;

+(NSArray *) cellModelFramesFromFile;

+(instancetype) cellModelFrameWithCellModel:(CellModel *) cellModel;

-(instancetype) initWithCellModel:(CellModel *) cellModel;
@end

NS_ASSUME_NONNULL_END
