//
//  ViewController.m
//  播放音乐
//
//  Created by 章芝源 on 15/10/31.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ZYAudioTool.h"
@interface ViewController ()
///player   播放音乐
//@property(nonatomic, strong)AVAudioPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

///MARK: -懒加载
//- (AVAudioPlayer *)player
//{
//    if (_player == nil) {
//        
//        //0.得到url
//        NSURL *url = [[NSBundle mainBundle] URLForResource:@"339744.mp3" withExtension:nil];
//        //1. 准备播放器
//        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
//        //2. 准备播放
//        [_player prepareToPlay];
//    }
//    return _player;
//}

///开始
- (IBAction)play:(id)sender {
    [ZYAudioTool playMusicWithName:@"339744.mp3"];
}

///暂停
- (IBAction)pause:(id)sender {
    [ZYAudioTool pauseMusicWithName:@"339744.mp3"];
}

///停止
- (IBAction)stop:(id)sender {
    [ZYAudioTool stopMusicWithName:@"339744.mp3"];
}



@end
