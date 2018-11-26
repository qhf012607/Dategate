//
//  ProjectBillCell.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/22.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "ProjectBillCell.h"

@interface ProjectBillCell ()
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *contentLab;
@property (nonatomic,strong) UIView *lineView;
@end
@implementation ProjectBillCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"projectBillCell";
    ProjectBillCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ProjectBillCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupOriginal];
    }
    return self;
}

-(void)setupOriginal
{
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(@16);
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(@(-16));
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.right.equalTo(@(-16));
        make.bottom.equalTo(@(-1));
        make.height.equalTo(@1);
    }];
}

#pragma mark -
-(void)projectBillWithDictionary:(NSDictionary *)dict
{
    _titleLab.text = dict[@"title"];
    
    _contentLab.text = dict[@"content"];
}

#pragma mark - lazy
-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLab.textColor = COLORHEX(@"cccdcd");
        _titleLab.font = FONT(16);
    }
    return _titleLab;
}

-(UILabel *)contentLab
{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLab.textColor = COLORHEX(@"cccdcd");
        _contentLab.font = FONT(16);
    }
    return _contentLab;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGBA(255, 255, 255, 0.1);
    }
    return _lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
