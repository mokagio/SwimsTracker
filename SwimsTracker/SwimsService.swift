//
//  SwimsService.swift
//  SwimsTracker
//
//  Created by Giovanni on 25/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Foundation

class SwimsService {

  func allSwims() -> [Swim] {
    return [
      Swim(date: NSDate(timeIntervalSinceNow: -24 * 6 * 6), length: 2, duration: 60 * 60),
      Swim(date: NSDate(timeIntervalSinceNow: -2 * 24 * 6 * 6), length: 2.1, duration: 60 * 60),
      Swim(date: NSDate(timeIntervalSinceNow: -3 * 24 * 6 * 6), length: 2.2, duration: 60 * 60),
    ]
  }
}
