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

    guard let navigationController = window?.rootViewController as? UINavigationController else {
      preconditionFailure()
    }
    guard let swimListViewController = navigationController.topViewController as? SwimListViewController else {
      preconditionFailure()
    }

    swimListViewController.viewModel = SwimListViewModel(list: swimsService.allSwims())

    return true
  }
}
