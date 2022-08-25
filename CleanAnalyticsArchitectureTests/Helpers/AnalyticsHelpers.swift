//
//  AnalyticsHelpers.swift
//  CleanAnalyticsArchitectureTests
//
//  Created by Greener Chen on 2022/8/25.
//

import Foundation
@testable import CleanAnalyticsArchitecture

protocol SpyEngineProtocol {
    var events: [AnalyticsEvent] { get set }
}

typealias AnalyticsEngineDI = AnalyticsEngine & SpyEngineProtocol

class SpyEngine: AnalyticsEngineDI {
    let name: String
    var events: [AnalyticsEvent] = []
    
    init(name: String) {
        self.name = name
    }
    
    func sendEvent(name: String, metadata: [String : String]) {
        let event = TestEvent(name: name, metadata: metadata)
        events.append(event)
    }
}

struct TestEvent: AnalyticsEvent {
    var name: String
    var metadata: [String : String]
}
