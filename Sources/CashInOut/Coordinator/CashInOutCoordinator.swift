//
//  CashInOutCoordinator.swift
//
//
//  Created by Bodgar Espinosa Miranda on 07/10/24.
//

import Foundation
import SwiftUI
import SwiftData
import CashSwitchboard
import Common

public class CashInOutCoordinator {
    private var modelContext: ModelContext
    private let type: String
    
    public init(modelContext: ModelContext, type: String) {
        self.modelContext = modelContext
        self.type = type
        registerDependencies()
    }
    
    @ViewBuilder public func start() -> some View {
        CashInOutView(viewModel: CashInOutViewModel(type: type))
    }
    
    private func registerDependencies() {
        ServiceLocator.register(SaveTransactionService.self, factory: SwiftDataSaveTransactionService(modelContext: self.modelContext))
    }
}
