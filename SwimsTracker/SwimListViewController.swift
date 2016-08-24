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

  var viewModel: SwimListViewModel?

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
    guard let viewModel = viewModel else {
      preconditionFailure("Attempted to load view controller's view without configuring the view model")
    }

    return viewModel.sections()
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let viewModel = viewModel else {
      preconditionFailure("Attempted to load view controller's view without configuring the view model")
    }

    return viewModel.rows(forSectionAtIndex: section) ?? 0
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let viewModel = viewModel else {
      preconditionFailure("Attempted to load view controller's view without configuring the view model")
    }

    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

    guard let swim = viewModel.swim(atIndexPath: indexPath) else {
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
