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

  let dummyData: [String] = { (0...42).map { "Row \($0)" } }()

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
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyData.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
    let dummyValue = dummyData[indexPath.row]
    cell.textLabel?.text = dummyValue
    return cell
  }
}

extension SwimListViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}
