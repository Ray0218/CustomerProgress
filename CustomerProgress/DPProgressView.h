//
//  DPProgressView.h
//  CustomerProgress
//
//  Created by Ray on 16/10/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPProgressView : UIView

@property (nonatomic,assign) CGFloat rProgress ;//进度 0~1


-(void)setCurValue:(CGFloat)curV maxValue:(CGFloat)max minValue:(CGFloat)min degree:(NSInteger)degres  ;


@end


@interface DPCustomerView : UIImageView

@property (nonatomic,strong) DPProgressView *rCusProgressView ;

@end
