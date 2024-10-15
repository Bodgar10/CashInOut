//
//  File.swift
//  
//
//  Created by Bodgar Espinosa Miranda on 07/10/24.
//

import Foundation
import SwiftData
import SwiftUI
import CashSwitchboard
import Common

public protocol SaveTransactionService: Service {
    func save(transaction: CashSwitchboard.Transaction) -> Bool
}

public class SwiftDataSaveTransactionService: SaveTransactionService {
    
    private let modelContext: ModelContext
    public var id = UUID()
    
    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    public func save(transaction: CashSwitchboard.Transaction) -> Bool {
        modelContext.insert(transaction)
        do {
            try modelContext.save()
            return true
        }
        catch {
            return false
        }
    }
}
