//
//  AnalyticsEvents.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import Foundation

protocol AnalyticsEvent {
    var name: String { get set }
    var metadata: [String:String] { get set }
}


// MARK: - Home
struct HomeScreenAppearedEvent: AnalyticsEvent {
    var name: String = "HomeScreenAppeared"
    var metadata: [String : String] = [:]
}
