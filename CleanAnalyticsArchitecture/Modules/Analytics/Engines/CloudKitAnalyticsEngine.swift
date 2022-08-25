//
//  CloudKitAnalyticsEngine.swift
//  CleanAnalyticsArchitecture
//
//  Created by Greener Chen on 2022/8/25.
//

import Foundation
import CloudKit

class CloudKitAnalyticsEngine: AnalyticsEngine {
    private let database: CKDatabase
    
    init(database: CKDatabase = CKContainer.default().publicCloudDatabase) {
        self.database = database
    }
    
    func sendEvent(name: String, metadata: [String : String]) {
        let record = CKRecord(recordType: "AnalyticsEvent_\(name)")
        
        for (key, value) in metadata {
            record[key] = value as NSString
        }
        
        database.save(record) { _, _ in
            // Treat this as a fire-and-forget type operation
        }
    }
}
