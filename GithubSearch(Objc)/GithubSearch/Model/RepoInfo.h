//
//  RepoInfo.h
//  GithubSearch(Objc)
//
//  Created by Nathan on 19/02/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepoInfo: NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSURL *detail_url;
@property (nonatomic, copy) NSURL *image_url;

+ (RepoInfo *)initWithName: (NSString *) _name detailUrl: (NSURL *) _detailUrl
                  imageUrl: (NSURL *) _imageUrl Description: (NSString *) _description;

@end

