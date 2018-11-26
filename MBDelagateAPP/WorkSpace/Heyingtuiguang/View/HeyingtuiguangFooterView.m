//
//  HeyingtuiguangFooterView.m
//  MBDelagateAPP
//
//  Created by Tsing on 2018/10/17.
//  Copyright © 2018 rhonin. All rights reserved.
//

#import "HeyingtuiguangFooterView.h"
#import "HeyingtuiguangFooterCell.h"

@interface HeyingtuiguangFooterView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionViewTG;
@property (nonatomic,strong) UIImageView *codeImgView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
@implementation HeyingtuiguangFooterView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.collectionViewTG];
        [self.collectionViewTG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        
        [self addSubview:self.codeImgView];
        [self.codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(@22);
            make.height.equalTo(@22);
        }];
    }
    return self;
}

#pragma mark - collectionViewDelegate & dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeyingtuiguangFooterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tuiguangCellId" forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"tuiguangCell_error");
    }
    [cell tuiguangCellWithDictionary:self.dataArray[indexPath.row] indexPath:indexPath];
    return cell;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectItem" object:self.dataArray[indexPath.row]];
    self.itemsDidSelectBlock(indexPath.row);
}

#pragma mark -
-(UICollectionView *)collectionViewTG
{
    if (!_collectionViewTG) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-66)/2, 140);
        //
        _collectionViewTG = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        [_collectionViewTG registerClass:[HeyingtuiguangFooterCell class] forCellWithReuseIdentifier:@"tuiguangCellId"];
        _collectionViewTG.backgroundColor = [UIColor clearColor];
        _collectionViewTG.delegate = self;
        _collectionViewTG.dataSource = self;
    }
    return _collectionViewTG;
}

-(UIImageView *)codeImgView
{
    if (!_codeImgView) {
        _codeImgView = [[UIImageView alloc]init];
        _codeImgView.image = [UIImage imageNamed:@"heyingscanning"];
    }
    return _codeImgView;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@{@"title":@"tuiguang"},@{@"title":@"tiyu"},@{@"title":@"heying"},@{@"title":@"daima"}, nil];
    }
    return _dataArray;
}

@end
