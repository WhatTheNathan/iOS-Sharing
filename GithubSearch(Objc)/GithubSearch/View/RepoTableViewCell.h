//
//  RepoTableViewCell.h
//  GithubSearch
//
//  Created by Nathan on 20/02/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepoInfo.h"

@interface RepoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *repoImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic,copy) RepoInfo *repoInfo;

- (void) updateUI;
@end
