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

  // It returns the Swim model in the same position as the index path row, if the
  // row is within the swims list lenght
  func test_returnsSwimForIndexPath() {
    let list = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 2),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 3)
    ]
    let subject = SwimListViewModel(list: list)

    // TODO: Use proper equality test
    let index = 1
    let indexPath = NSIndexPath(forRow: index, inSection: 0)
    XCTAssertEqual(subject.swim(atIndexPath: indexPath)?.duration, list[index].duration)
  }

  // It returns the Swim model in the same position as the index path row, if the
  // row is within the swims list lenght
  //
  // Edge case: last item
  func test_returnsSwimForIndexPath_edgeCase() {
    let list = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 2),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 3)
    ]
    let subject = SwimListViewModel(list: list)

    // TODO: Use proper equality test
    let index = list.count - 1
    let indexPath = NSIndexPath(forRow: index, inSection: 0)
    XCTAssertEqual(subject.swim(atIndexPath: indexPath)?.duration, list[index].duration)
  }

  // It returns the .None when the index path row index is
  // bigger than the swims list lenght.
  func test_returnsSwimForIndexPath_outOfBounds() {
    let list = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 2),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 3)
    ]
    let subject = SwimListViewModel(list: list)

    let index = list.count
    let indexPath = NSIndexPath(forRow: index, inSection: 0)
    XCTAssertNil(subject.swim(atIndexPath: indexPath))
  }

  // It returns the .None when the index path row index is negative.
  //
  // This edge case should be impossible but since the type of
  // row in NSIndexPath is Int and not UInt it is still worth
  // checking.
  func test_returnsSwimForIndexPath_edgeCase_2() {
    let list = [
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 1),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 2),
      Swim(date: NSDate(timeIntervalSinceNow: 0), length: 1, duration: 3)
    ]
    let subject = SwimListViewModel(list: list)

    let indexPath = NSIndexPath(forRow: -1, inSection: 0)
    XCTAssertNil(subject.swim(atIndexPath: indexPath))
  }
}
