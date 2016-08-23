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

  func rows(forSectionAtIndex index: Int) -> Int? {
    guard index == 0 else {
      return .None
    }

    return list.count
  }

  func swim(atIndexPath indexPath: NSIndexPath) -> Swim? {
    let index = indexPath.row

    guard index >= 0 && list.count > index else {
      return .None
    }

    return list[index]
  }
}
