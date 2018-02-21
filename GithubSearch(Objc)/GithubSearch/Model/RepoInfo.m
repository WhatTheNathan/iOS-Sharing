//
//  RepoInfo.m
//  GithubSearch
//
//  Created by Nathan on 20/02/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

#import "RepoInfo.h"

@implementation RepoInfo
@synthesize description;

+ (RepoInfo *)initWithName: (NSString *) _name detailUrl: (NSURL *) _detailUrl
          imageUrl: (NSURL *) _imageUrl Description: (NSString *) _description {
    RepoInfo *repoInfo = [[RepoInfo alloc]init];
    
    repoInfo.name = _name;
    repoInfo.detail_url = _detailUrl;
    repoInfo.image_url = _imageUrl;
    repoInfo.description = _description;
    
    return repoInfo;
}

@end
