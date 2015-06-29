//
//  MyScene.m
//  EmitterDemonstration
//
//  Created by jim Veneskey on 6/29/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // to use the emitter - we need to first unbundle or unarchive it
        SKEmitterNode *snow = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"SnowParticle" ofType:@"sks"]];
        // now that the object is extracted - add it to the scene...
        snow.position = CGPointMake(size.width/2, size.height);
        
        // bump the simulation 10 seconds in the future
        [snow advanceSimulationTime:10];
        [self addChild:snow];

    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
