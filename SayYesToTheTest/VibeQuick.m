//
//  VibeQuick.m
//  SayYesToTheTest
//
//  Created by Frank Williams on 3/7/15.
//  Copyright (c) 2015 Frank Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VibeQuick.h"
@import AudioToolbox;

void AudioServicesStopSystemSound(int);
void AudioServicesPlaySystemSoundWithVibration(int, id, NSDictionary *);

@implementation vibeObject;

- (void)vibrate
{
    AudioServicesStopSystemSound(kSystemSoundID_Vibrate);
    
    int64_t vibrationLength = 30;
    
    NSArray *pattern = @[@NO, @0, @YES, @(vibrationLength)];
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"VibePattern"] = pattern;
    dictionary[@"Intensity"] = @1;
    
    AudioServicesPlaySystemSoundWithVibration(kSystemSoundID_Vibrate, nil, dictionary);
}

@end