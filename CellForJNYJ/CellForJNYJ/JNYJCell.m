//
//  JNYJCell.m
//  CellForJNYJ
//
//  Created by William on 2/4/15.
//  Copyright (c) 2015 JNYJ. All rights reserved.
//

#import "JNYJCell.h"

@interface JNYJCell ()<JNYJCellButtonDelegate>

@end

@implementation JNYJCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        //
        [self setCellHeight:CGFloat_height_cell];
        //
    }
    return self;
}
#pragma mark Delegate

-(void)callback_touchUp:(id)sender{
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        if (sender == buttonCell) {
            [self event_cellSelected:sender];
        }else if (sender == buttonCheckbox){
            [self event_selectedCheckbox:sender];
        }else if (sender == buttonShowDetails) {
            [self event_showDetail:sender];
        }
    }
}
-(void)callback_move2Right:(id)sender{
}
-(void)callback_move2Left:(id)sender{

}

#pragma mark Event

-(void)event_cellSelected:(id)sender{
    NSLog(@"event_cellSelected");
}
-(void)event_selectedCheckbox:(id)sender{
    NSLog(@"event_selectedCheckbox");
}
-(void)event_showDetail:(id)sender{
    NSLog(@"event_showDetail");
}

#pragma mark Public

-(void)setCellHeight:(CGFloat)height{
    
    CGRect rect_ = self.frame;
    rect_.size.height = height;
    [self setFrame:rect_];
    CGRect rect_s = self.frame;
    if (self.viewBG) {
        
        rect_ = self.imageViewLogo.frame;
        rect_.size.height = rect_s.size.height-(rect_.origin.y*2.0);
        [self.imageViewLogo setFrame:rect_];
        //
        rect_ = self.viewBG.frame;
        rect_.size.height = height;
        [self.viewBG setFrame:rect_];
        //
        rect_ = self.labelCellTitle.frame;
        rect_.size.height = rect_s.size.height/2.0;
        [self.labelCellTitle setFrame:rect_];
        rect_ = self.labelCellDetail.frame;
        rect_.size.height = rect_s.size.height/2.0;
        [self.labelCellDetail setFrame:rect_];
        //
        rect_ = self.imageViewLogo_showDetail.frame;
        rect_s = self.imageViewLogo.frame;
        rect_.size.height = rect_s.size.height;
        [self.imageViewLogo_showDetail setFrame:rect_];
        //
        
    }else{
        //
        CGFloat height_logo = (height-10*2);
        height_logo = (height_logo>=10.0f) ? height_logo : 10.0f;
        UIImageView *imageView_ = [[UIImageView alloc] initWithFrame:
                                   CGRectMake(10, 10, height_logo, height_logo)];
        [self addSubview:imageView_];
//        [imageView_ setBackgroundColor:[UIColor clearColor]];
        //button 4 show details
        rect_ = imageView_.frame;
        rect_s = self.frame;
        JNYJCellButton *button_ = [JNYJCellButton buttonWithType:UIButtonTypeCustom];
        [button_ setFrame:CGRectMake(rect_.origin.x-10, 0, rect_.size.width+(10+10), rect_s.size.height)];
        [self addSubview:button_];
        buttonCheckbox = button_;
        [button_ setCallBack_delegate:self];
        [button_ setBackgroundColor:[UIColor clearColor]];
        [button_ setAlpha:0.6];
        //
        rect_  = self.frame;
        UIView *view_ = [[UIView alloc] initWithFrame:
                         CGRectMake(0, 0, rect_.size.width, height)];
        [self addSubview:view_];
        self.viewBG = view_;
//        [view_ setBackgroundColor:[UIColor clearColor]];
        //
        rect_ = imageView_.frame;
        rect_s = self.frame;
        UILabel *label_ = [[UILabel alloc] initWithFrame:
                           CGRectMake(rect_.origin.x, 0, rect_.size.width, height/2.0)];
        [self.viewBG addSubview:label_];
        self.labelCellTitle = label_;
//        [label_ setBackgroundColor:[UIColor clearColor]];
        //
        rect_ = label_.frame;
        rect_s = self.frame;
        label_ = [[UILabel alloc] initWithFrame:
                           CGRectMake(rect_.origin.x,
                                      rect_.origin.y+rect_.size.height,
                                      rect_.size.width, rect_.size.height)];
        [self.viewBG addSubview:label_];
        self.labelCellDetail = label_;
//        [label_ setBackgroundColor:[UIColor clearColor]];
        //
        rect_ = self.frame;
        imageView_ = [[UIImageView alloc] initWithFrame:
                      CGRectMake(rect_.size.width-10-height_logo, 10,
                                 height_logo, height_logo)];
        [self.viewBG addSubview:imageView_];
//        [imageView_ setBackgroundColor:[UIColor clearColor]];
        //Reset labels frame
        rect_ = self.labelCellTitle.frame;
        rect_s = imageView_.frame;
        rect_.size.width = rect_s.origin.x - rect_.origin.x - rect_.origin.x;
        [self.labelCellTitle setFrame:rect_];
        rect_ = self.labelCellDetail.frame;
        rect_s = self.labelCellTitle.frame;
        rect_.size.width = rect_s.size.width;
        [self.labelCellDetail setFrame:rect_];
        //
        rect_ = self.viewBG.frame;
        button_ = [JNYJCellButton buttonWithType:UIButtonTypeCustom];
        [button_ setFrame:CGRectMake(0, 0, rect_.size.width, rect_.size.height)];
        [self.viewBG addSubview:button_];
        buttonCell = button_;
        [button_ setCallBack_delegate:self];
        [button_ setBackgroundColor:[UIColor clearColor]];
        [button_ setAlpha:0.6];
        
        //button 4 show details
        rect_ = imageView_.frame;
        rect_s = self.viewBG.frame;
        button_ = [JNYJCellButton buttonWithType:UIButtonTypeCustom];
        [button_ setFrame:CGRectMake(rect_.origin.x-10, 0, rect_.size.width+(10+10), rect_s.size.height)];
        [self.viewBG addSubview:button_];
        buttonShowDetails = button_;
        [button_ setCallBack_delegate:self];
        [button_ setBackgroundColor:[UIColor clearColor]];
        [button_ setAlpha:0.6];
        //
        rect_ = self.viewBG.frame;
        imageView_ = [[UIImageView alloc] initWithFrame:
                      CGRectMake(0,
                                 rect_.size.height-0.5,
                                 rect_.size.width,
                                 0.5)];
        imageViewLine = imageView_;
        [view_ addSubview:imageView_];
        [imageView_ setBackgroundColor:[UIColor grayColor]];
        //
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        //
    }
    
}
-(void)setCellValues:(id)sender{
    if(sender && [sender isKindOfClass:[NSDictionary class]]){
        self.dicValues = [NSDictionary dictionaryWithDictionary:sender];
    }
}

-(void)setHiddenLine:(BOOL)hidden{
    [imageViewLine setHidden:hidden];
}

-(void)setImageViewLogo:(UIImageView *)imageViewLogo{
    [_imageViewLogo removeFromSuperview];
    _imageViewLogo = nil;
    _imageViewLogo =imageViewLogo;
    [self addSubview:_imageViewLogo];
    CGRect rect_ = self.frame;
    CGRect rect_s = imageViewLogo.frame;
    [_imageViewLogo setFrame:
     CGRectMake(rect_.origin.x,
                (rect_.size.height-rect_s.size.height)/2.0,
                rect_s.size.width, rect_s.size.height)];
}

+(JNYJCell *)newCell{
    JNYJCell *cell_ =[[JNYJCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell_;
}
@end



@implementation JNYJCellButton : UIButton

#pragma mark Touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    isMoved = NO;
    isMoved2Right = YES;
    UITouch *touch =  [touches anyObject];
    CGPoint point_ = [touch locationInView:self];
    _pointTouch = point_;
//    NSLog(@"touch began--- 1 --(%d-%@)",(int)touch.tapCount,NSStringFromCGPoint(self.pointTouch));
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =  [touches anyObject];
    CGPoint point_ = [touch locationInView:self];
    CGFloat float_distance = 10.0f;
    CGFloat float_distance_current = 0.0f;
    BOOL isMove2Right_ = YES;
    if (point_.x > _pointTouch.x) {
        float_distance_current = point_.x-_pointTouch.x;
        isMove2Right_ = YES;
    }else{
        float_distance_current = _pointTouch.x - point_.x;
        isMove2Right_ = NO;
    }
    if (float_distance_current > float_distance) {
        isMoved = YES;
        isMoved2Right = isMove2Right_;
    }
//    NSLog(@"touch move--- 1 --(%d-%@)",(int)touch.tapCount,NSStringFromCGPoint(point_));
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch =  [touches anyObject];
//    CGPoint point_ = [touch locationInView:self];
    [self event_touchUp:self];
//    NSLog(@"touch end--- 1 --(%d-%@)",(int)touch.tapCount,NSStringFromCGPoint(point_));
}
//-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch =  [touches anyObject];
//    CGPoint point_ = [touch locationInView:self];
//    NSLog(@"touch cancel--- 1 --(%d-%@)",(int)touch.tapCount,NSStringFromCGPoint(point_));
//}
#pragma mark delegate
-(void)event_touchUp:(id)sender{
    if (isMoved) {
        if (isMoved2Right) {
            [self event_move2Right:self];
        }else{
            [self event_move2Left:self];
        }
    }else{
//        NSLog(@"event_touchUp");
        if ([self.callBack_delegate respondsToSelector:@selector(callback_touchUp:)]) {
            [self.callBack_delegate callback_touchUp:self];
        }
    }
}
-(void)event_move2Right:(id)sender{
//    NSLog(@"event_move2Right");
    if (isMoved) {
        if ([self.callBack_delegate respondsToSelector:@selector(callback_move2Right:)]) {
            [self.callBack_delegate callback_move2Right:self];
        }
    }else{
    }
}
-(void)event_move2Left:(id)sender{
//    NSLog(@"event_move2Left");
    if (isMoved) {
        if ([self.callBack_delegate respondsToSelector:@selector(callback_move2Left:)]) {
            [self.callBack_delegate callback_move2Left:self];
        }
    }else{
    }
}
@end








