//
//  AppDelegate.swift
//  Querying Pace and Cadence Information
//
//  Created by Vandad on 7/29/15.
//  Copyright © 2015 Pixolity. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  let pedometer = CMPedometer()
  
  func example1(){
    
    guard CMPedometer.isCadenceAvailable() &&
      CMPedometer.isPaceAvailable() else{
      print("Pace and cadence data are not available")
      return
    }
    
    let oneWeekAgo = NSDate(timeIntervalSinceNow: -(7 * 24 * 60 * 60))
    pedometer.startPedometerUpdatesFromDate(oneWeekAgo) {data, error in
      
      guard let pData = data where error == nil else{
        return
      }
      
      if let pace = pData.currentPace{
        print("Pace = \(pace)")
      }
      
      if let cadence = pData.currentCadence{
        print("Cadence = \(cadence)")
      }
      
    }
    
    //remember to stop the pedometer updates with stopPedometerUpdates()
    //at some point
    
  }
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    example1()
    
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

