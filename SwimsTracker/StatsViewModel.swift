//
//  StatsViewModel.swift
//  SwimsTracker
//
//  Created by Giovanni on 29/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Foundation

struct StatsViewModel {
  let swims: [Swim]

  func distanceLabelText() -> String {
    return "Distance\n\(swims.map { $0.length }.reduce(0, combine: (+)))km"
  }
}