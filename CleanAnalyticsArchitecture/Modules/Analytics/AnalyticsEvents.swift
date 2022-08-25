//
//  AnalyticsEvents.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import Foundation

protocol AnalyticsEvent {
    var name: String { get }
    var metadata: [String:String] { get }
}


// MARK: - Home events
enum HomeScreenEvent {
    case homeScreenAppeared
    case aButtonTapped(clicked: String)
}

extension HomeScreenEvent: AnalyticsEvent {
    var name: String {
        switch self {
        case .homeScreenAppeared:
            return "HomeScreenAppeared"
        case .aButtonTapped:
            return "AButtonTapped"
        }
    }
    var metadata: [String:String] {
        switch self {
        case .homeScreenAppeared:
            return [:]
        case .aButtonTapped(let clicked):
            return ["clicked": clicked]
        }
    }
}
