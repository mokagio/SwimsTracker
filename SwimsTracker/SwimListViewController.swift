//
//  SwimListViewController.swift
//  SwimsTracker
//
//  Created by Giovanni on 23/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import UIKit

class SwimListViewController: UIViewController {

  @IBOutlet var tableView: UITableView!

  let dummyViewModel = SwimListViewModel(list: [
    Swim(date: NSDate(timeIntervalSinceNow: -24 * 6 * 6), length: 2, duration: 60 * 60),
    Swim(date: NSDate(timeIntervalSinceNow: -2 * 24 * 6 * 6), length: 2.1, duration: 60 * 60),
    Swim(date: NSDate(timeIntervalSinceNow: -3 * 24 * 6 * 6), length: 2.2, duration: 60 * 60),
  ])

  let cellIdentifier = "cell"

  override func viewDidLoad() {
    super.viewDidLoad()

    automaticallyAdjustsScrollViewInsets = false

    title = "🏊"
    configureTableView()
  }

  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
}

extension SwimListViewController: UITableViewDataSource {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return dummyViewModel.sections()
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyViewModel.rows(forSectionAtIndex: section) ?? 0
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

    guard let swim = dummyViewModel.swim(atIndexPath: indexPath) else {
      return cell
    }

    cell.textLabel?.text = "Swam for \(swim.length) km on \(swim.date)"

    return cell
  }
}

extension SwimListViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}
