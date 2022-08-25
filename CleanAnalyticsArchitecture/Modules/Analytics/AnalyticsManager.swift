//
//  AnalyticsManager.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import Foundation

class AnalyticsManager {
    static let shared = AnalyticsManager(engines: [
        CloudKitAnalyticsEngine()
    ])
    private let engines: [AnalyticsEngine]
    
    init(engines: [AnalyticsEngine]) {
        self.engines = engines
    }
    
    func log(_ event: AnalyticsEvent) {
        for engine in engines {
            engine.sendEvent(name: event.name, metadata: event.metadata)
        }
    }
}

// MARK: - Home events
extension AnalyticsManager {
    func logHomeScreenAppeared() {
        log(HomeScreenAppearedEvent())
    }
}
