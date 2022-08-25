//
//  ViewController.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import UIKit

class ViewController: UIViewController {

    private let analytics: AnalyticsManager = AnalyticsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        analytics.logHomeScreenAppeared()
    }
}

