//
//  ViewController.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import UIKit

class ViewController: UIViewController {

    var analytics: AnalyticsManager = AnalyticsManager.shared
    
    var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let aButton = UIButton(type: .custom)
        aButton.titleLabel?.text = "Confirm"
        aButton.addTarget(self, action: #selector(ViewController.aButtonTapped), for: .touchUpInside)
        confirmButton = aButton
        view.addSubview(confirmButton)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        analytics.log(HomeScreenEvent.homeScreenAppeared)
    }
}

extension ViewController {
    @objc
    private func aButtonTapped() {
        analytics.log(HomeScreenEvent.aButtonTapped(clicked: "confirmed"))
    }
}
