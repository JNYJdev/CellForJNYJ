//
//  JNYJCell.h
//  CellForJNYJ
//
//  Created by William on 2/4/15.
//  Copyright (c) 2015 JNYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CGFloat_height_cell 44.0f

@class JNYJCellButton;

@protocol JNYJCellDelegate <NSObject>
@optional
-(void)callback_cell_click:(id)sender;
-(void)callback_cell_details:(id)sender;
-(void)callback_cell_checkbox:(id)sender;
@end

@interface JNYJCell : UITableViewCell{
    JNYJCellButton *buttonCheckbox;
    JNYJCellButton *buttonCell;
    JNYJCellButton *buttonShowDetails;
    UIImageView     *imageViewLine;
}

@property(nonatomic,strong)UIView *viewBG;
@property(nonatomic,strong)UILabel *labelCellTitle;
@property(nonatomic,strong)UILabel *labelCellDetail;
@property(nonatomic,strong)UIImageView *imageViewLogo;
@property(nonatomic,strong)UIImageView *imageViewLogo_showDetail;

@property(nonatomic,strong)NSDictionary *dicValues;

@property(nonatomic,weak)id<JNYJCellDelegate> callback_delegate;


-(void)setCellHeight:(CGFloat)height;

-(void)event_cellSelected:(id)sender;
-(void)event_selectedCheckbox:(id)sender;
-(void)event_showDetail:(id)sender;

-(void)setCellValues:(id)sender;

-(void)setHiddenLine:(BOOL)hidden;

+(JNYJCell *)newCell;
@end

@protocol JNYJCellButtonDelegate <NSObject>
-(void)callback_touchUp:(id)sender;
@optional
-(void)callback_move2Right:(id)sender;
-(void)callback_move2Left:(id)sender;

@end

@interface JNYJCellButton : UIButton{
    BOOL isMoved;
    BOOL isMoved2Right;
}
@property(nonatomic,assign,readonly)CGPoint pointTouch;
@property(nonatomic,weak)id<JNYJCellButtonDelegate>callBack_delegate;
-(void)event_touchUp:(id)sender;
-(void)event_move2Right:(id)sender;
-(void)event_move2Left:(id)sender;
@end
