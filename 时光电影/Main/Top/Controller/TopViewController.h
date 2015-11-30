//
//  TopViewController.h
//  时光网
//
//  Created by imac on 15/10/31.
//  Copyright © 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_data;
}
@property (strong, nonatomic) IBOutlet UICollectionView *topCollection;

@end
