//
//  AppDelegate.swift
//  SwimsTracker
//
//  Created by Giovanni on 23/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  let swimsService = SwimsService()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    guard let tabBarController = window?.rootViewController as? UITabBarController else {
      preconditionFailure()
    }
    guard let navigationController = tabBarController.viewControllers?.first as? UINavigationController else {
      preconditionFailure()
    }
    guard let swimListViewController = navigationController.topViewController as? SwimListViewController else {
      preconditionFailure()
    }

    let swims = swimsService.allSwims()
    swimListViewController.viewModel = SwimListViewModel(list: swims)

    guard let x = tabBarController.viewControllers?[1] as? UINavigationController else {
      preconditionFailure()
    }
    guard let y = x.topViewController as? StatsViewController else {
      preconditionFailure()
    }

    y.viewModel = StatsViewModel(swims: swims)

    return true
  }
}
