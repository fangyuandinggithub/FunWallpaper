//
//  NewLastViewController.m
//  ViewStock
//
//  Created by SayHi on 2019/1/22.
//  Copyright © 2019年 ViewStock. All rights reserved.
//

#import "NewLastViewController.h"
#import "LatestCollectionViewCell.h"
@interface NewLastViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *latestCollectionView;

@property (nonatomic, strong)NSMutableArray *latestArray;

@end

@implementation NewLastViewController

- (NSMutableArray *)latestArray{
    if(!_latestArray){
        _latestArray = [NSMutableArray array];
    }
    return _latestArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self resetNavi];
    [self initLatestUI];
    [self requestLatestData];
}
- (void)requestLatestData{
    [SVProgressHUD show];
    [[RequestNet manager] GetWallPaperWithBlock:^(NSData * _Nonnull postData, ResultData * _Nonnull status, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if([status.code isEqualToString:@"1"]){
            TFHpple * htmls = [[TFHpple alloc]initWithData:postData isXML:YES] ;
            NSArray *latestArry = [htmls searchWithXPathQuery:@"//img[@class='img-fluid']"];
            for (TFHppleElement *latestElement in latestArry) {
                [self.latestArray addObject:[NSString stringWithFormat:@"https://graffitiwallpaper.com%@",[latestElement objectForKey:@"src"]]];
                if(self.latestArray.count > 30){
                    return ;
                }
                
            }
           
            [self.latestCollectionView reloadData];
            
        }else{
            
        }
        
    }];
}
//修改导航栏
- (void)resetNavi{
    [self.navigationController.navigationBar setTranslucent:true];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)initLatestUI{
    self.latestCollectionView.delegate = self;
    self.latestCollectionView.dataSource = self;
    self.latestCollectionView.scrollEnabled  = YES;
    self.latestCollectionView.contentSize = CGSizeMake(kScreenWidth*10, kScreenHeight);

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.latestCollectionView.collectionViewLayout = layout;
   
    self.latestCollectionView.backgroundColor = [UIColor clearColor];
    [self.latestCollectionView registerNib:[UINib nibWithNibName:@"LatestCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LatestCollectionViewCell"];
    self.latestCollectionView.pagingEnabled = YES;
    
}
#pragma Mark -<UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return  self.latestArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LatestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LatestCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell.wallpaperImageView sd_setImageWithURL:[NSURL URLWithString:self.latestArray[indexPath.row]] placeholderImage:nil];
  
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
}
#pragma mark - UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return  CGSizeMake(kScreenWidth, kScreenHeight);
}
//设置每个item的UIEdgInsets 相对于上左下右四个边界的位移
- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item的水平间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//行间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


@end
