//
//  SwimListViewModelTests.swift
//  SwimsTracker
//
//  Created by Giovanni on 23/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import XCTest
@testable import SwimsTracker

class SwimListViewModelTests: XCTestCase {

  // It returns 1 as the number of sections
  func test_numberOfSections_equals_1() {
    let subject = SwimListViewModel(list: [])
    XCTAssertEqual(subject.sections(), 1)
  }
}
