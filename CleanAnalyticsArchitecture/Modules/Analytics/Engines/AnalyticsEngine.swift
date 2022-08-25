//
//  AnalyticsEngine.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import Foundation

protocol AnalyticsEngine {
    func sendEvent(name: String, metadata: [String:String])
}
