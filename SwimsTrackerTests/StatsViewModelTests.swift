//
//  StatsViewModelTests.swift
//  SwimsTracker
//
//  Created by Giovanni on 29/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import XCTest
@testable import SwimsTracker

class StatsViewModelTests: XCTestCase {

  // When given an array of swims
  // It returns overall distance
  func testDistance() {
    let input = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 3, duration: 2),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 2.1, duration: 3)
    ]
    let sut = StatsViewModel(swims: input)

    let output = sut.distanceLabelText()

    XCTAssertEqual(output, "6.1")
  }
}
