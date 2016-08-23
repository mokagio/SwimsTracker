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

  // It returns the list count as the number of rows for section at index 0
  func test_numberOfRows_equals_list_count() {
    let list = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1)
    ]
    let subject = SwimListViewModel(list: list)

    XCTAssertEqual(subject.rows(forSectionAtIndex: 0), list.count)
  }

  // It returns .None if the section index is not 0
  func test_numberOfRows_none() {
    let list = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1)
    ]
    let subject = SwimListViewModel(list: list)

    XCTAssertNil(subject.rows(forSectionAtIndex: 42))
  }
}
