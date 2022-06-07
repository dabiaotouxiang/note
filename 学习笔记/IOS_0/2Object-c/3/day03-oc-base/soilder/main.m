//
//  main.m
//  soilder
//
//  Created by lsb on 2022/5/2.
//

#import <Foundation/Foundation.h>
#import "Solider.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Bullet *bullet = [Bullet new];
        [bullet setModel:@"尖子弹"];
        [bullet setCalibre:7.62f];
        
        Magazine *magazine = [Magazine new];
        [magazine setBulletCount:30];
        
        Gun *gun = [Gun new];
        [gun setModel:@"ak47"];
        [gun setRange:400];
        [gun setBullet:bullet];
        [gun setMagazine:magazine];
        
        Solider *solider = [Solider new];
        [solider setModel:@"A"];
        [solider setGun:gun];
        [solider setName:@"111"];
        [solider setMagazineCount:3];
        
        
        BOOL result = [solider shot];
        while (result){
            result = [solider shot];
        }
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
