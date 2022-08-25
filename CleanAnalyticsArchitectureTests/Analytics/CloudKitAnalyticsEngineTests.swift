//
//  CloudKitAnalyticsEngineTests.swift
//  CleanAnalyticsArchitectureTests
//
//  Created by Greener Chen on 2022/8/25.
//

import XCTest
@testable import CleanAnalyticsArchitecture
import CloudKit

class CloudKitAnalyticsEngineTests: XCTestCase {

    var sut: CloudKitAnalyticsEngine!
    var sutDatabase: CKDatabase!
    var recordIDs: [CKRecord.ID]!
    
    override func setUpWithError() throws {
        sutDatabase = CKContainer.default().privateCloudDatabase
        sut = CloudKitAnalyticsEngine(database: sutDatabase)
        recordIDs = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        for id in recordIDs {
            sutDatabase.delete(withRecordID: id) { _, _ in
                // do nothing
            }
        }
        
    }

    func testSendEvents() throws {
        sut.sendEvent(name: "CloudKitTestEvent", metadata: ["status": "loaded"])
        
        let expectation = expectation(description: "Fetch data from CloudKit")
        let predicate = NSPredicate(format: "status = 'loaded'")
        let query = CKQuery(recordType: "AnalyticsEvent_CloudKitTestEvent", predicate: predicate)
        sutDatabase.fetch(withQuery: query) { [weak self] result in
            switch result {
            case let .success((matchResults: results, queryCursor: _)):
                XCTAssert(results.count > 0)
                for (recordID, _) in results {
                    self?.recordIDs.append(recordID)
                }
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

}
