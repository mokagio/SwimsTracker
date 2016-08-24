//
//  StatsViewController.swift
//  SwimsTracker
//
//  Created by Giovanni on 25/08/2016.
//  Copyright © 2016 mokagio. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

  @IBOutlet var totalLengthLabel: UILabel!
  @IBOutlet var paceLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "📈"

    totalLengthLabel.numberOfLines = 0
    totalLengthLabel.textAlignment = .Center
    totalLengthLabel.text = "Distance\nTODO km"

    paceLabel.numberOfLines = 0
    paceLabel.textAlignment = .Center
    paceLabel.text = "Pace\nTODO km"
  }
}
