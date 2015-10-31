//
//  ZYAudioTool.m
//  02播放音效
//
//  Created by 章芝源 on 15/10/31.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYAudioTool.h"
#import <AVFoundation/AVFoundation.h>
@implementation ZYAudioTool

static NSMutableDictionary *_soundIDs;
static NSMutableDictionary *_musics;

+(void)initialize {
    
    _soundIDs = [NSMutableDictionary dictionary];
    _musics = [NSMutableDictionary dictionary];
}

#pragma mark - 播放音乐
+(void)playMusicWithName:(NSString *)musicName
{
    //断言音乐不为空
    assert(musicName);
    
    //取出播放器
    AVAudioPlayer *player = _musics[musicName];
    
    //判断播放器
    if(player == nil){
        //url
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"339744.mp3" withExtension:nil];
        
        //创建播放器
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        //准备播放
        [player prepareToPlay];  //大的音乐需要准备播放
        
        //存入字典汇总
        _musics[musicName] = player;
    }
    
    //播放音乐
    [player play];
}

#pragma mark - 暂停音乐
+ (void)pauseMusicWithName:(NSString *)musicName
{
    //断言音乐不为空
    assert(musicName);
    //取出音乐播放器
    AVAudioPlayer *player = _musics[musicName];
    
    if (player) {
        [player pause];
    }
}

#pragma mark - 停止音乐
+ (void)stopMusicWithName:(NSString *)musicName
{
    //断言音乐不为空
    assert(musicName);
    //取出音乐播放器
    AVAudioPlayer *player = _musics[musicName];
    
    if (player) {
        [player stop];
        player = nil;//停止英语就把音乐清空, 并从字典中已移除
        [_musics removeObjectForKey:musicName];
    }
}

#pragma mark - 播放音效

///集成一个方法
- (void)playSoundWithName:(NSString *)soundName
{
    ///重字典中去soundName对应的值
    ///unsignedIntValue  可以把  nil的值转化成基本数据类型也就是 0
    SystemSoundID soundID = [_soundIDs[soundName] unsignedIntValue];
    
    //判断soundID是不是为0  防止重复加载
    if(soundID == 0){
        ///得到url
        NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        
        //给soundID赋值`
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
        //把soundID放入字典中
        _soundIDs[soundName] = @(soundID);//基本数据类型包装成, 对象
    }
    
    //播放音效
    AudioServicesPlaySystemSound(soundID);
    
}

#pragma mark - 销毁音效
+(void)disposeSoundWihtName:(NSString *)soundName
{
    //1.从字典中取出音效的ID
    SystemSoundID soundID = [_soundIDs[soundName] unsignedIntValue];
    
    //2.销毁音效
    if(soundID){
        AudioServicesDisposeSystemSoundID(soundID);
    }
}

@end
