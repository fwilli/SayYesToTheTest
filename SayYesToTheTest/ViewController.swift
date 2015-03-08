//
//  ViewController.swift
//  SayYesToTheTest
//
//  Created by Frank Williams on 3/6/15.
//  Copyright (c) 2015 Frank Williams. All rights reserved.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var Bounces = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        collision.collisionDelegate = self
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 1.001
        animator.addBehavior(itemBehaviour)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        vibeObject.vibrate(<#vibeObject#>)
        Bounces++
    }

}

/*
func AudioServicesStopSystemSound(Int);
func AudioServicesPlaySystemSoundWithVibration(Int , NilLiteralConvertible, NSDictionary)();


Commented because it crashes sourcekit
func vibrate(){

    let vibrationLength = 30;
    
    let pattern: NSArray = [false, 0, true, vibrationLength];
    
    var dictionary:NSMutableDictionary;
    dictionary["VibePattern"] = pattern;
    dictionary["Intensity"] = 1;
    
    AudioServicesPlaySystemSoundWithVibration(kSystemSoundID_Vibrate, nil, dictionary);
}
*/