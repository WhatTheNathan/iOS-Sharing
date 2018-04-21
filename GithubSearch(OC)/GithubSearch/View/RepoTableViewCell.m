//
//  RepoTableViewCell.m
//  GithubSearch
//
//  Created by Nathan on 20/02/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

#import "RepoTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RepoTableViewCell
- (void) updateUI {
    [self.nameLabel setText:self.repoInfo.name];
    [self.descriptionLabel setText:self.repoInfo.description];
    [self.repoImage sd_setImageWithURL: self.repoInfo.image_url placeholderImage:nil];
}
@end
