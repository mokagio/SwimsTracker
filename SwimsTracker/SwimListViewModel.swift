//
//  SwimListViewModel.swift
//  SwimsTracker
//
//  Created by Giovanni on 23/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import Foundation

struct SwimListViewModel {

  let list: [Swim]

  func sections() -> Int {
    return 1
  }
}
