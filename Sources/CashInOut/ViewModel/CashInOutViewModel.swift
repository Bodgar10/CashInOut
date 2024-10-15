//
//  CashInOutViewModel.swift
//
//
//  Created by Bodgar Espinosa Miranda on 01/10/24.
//

import Foundation
import DesignSystem
import SwiftUI
import CashSwitchboard
import Common

public final class CashInOutViewModel: ObservableObject {
    
    // MARK: Dependencies
    
    @Dependency var saveTransactionService: SaveTransactionService
    @Dependency var navigationService: NavigationService
    
    // MARK: Textfields published
    
    @Published var subcategory = ""
    @Published var amount = ""
    @Published var category = PickerOptions(title: "", icon: .arrowDown)
    
    // MARK: Static published
    
    @Published var icon: CashIcons = .dollarIn
    @Published var title: String = .init()
    @Published var subtitle: String = .init()
    @Published var transactionType: String = .init()
    @Published var transactionPlaceholder: String = .init()
    @Published var colorTexts: Color = .purple
    @Published var alertMessage = ""
    @Published var showingAlert = false
    @Published var categories: [PickerOptions] = []
    private let type: String
    
    public init(type: String) {
        self.type = type
        validateType()
    }
    
    // MARK: Public functions
    
    public func saveData() {
        if subcategory.isEmpty || amount.isEmpty {
            alertMessage = "Escribe el monto y detalle que deseas guardar."
            showingAlert = true
        } else {
            let category = convertToCategory()
            let transaction = Transaction(category: category, subcategory: subcategory, amount: Double(amount) ?? 0.0, date: Date())
            alertMessage = saveTransactionService.save(transaction: transaction) ? "Se guardó tu \(transactionType) correctamente" : "No se pudo guardar tu \(transactionType), por favor inténtalo de nuevo."
            showingAlert = true
        }
    }
    
    public func sendToBalanceView() {
        navigationService.navigate(to: CashDestination.balance)
    }
    
    // MARK: Private functions
    
    private func validateType() {
        if type == "CashIn" {
            title = "Añade tu nuevo ingreso"
            transactionType = "Ingreso"
            transactionPlaceholder = "Nuevo Ingreso"
            colorTexts = .purple
            category = .init(title: CashSwitchboard.Category.salary.rawValue, icon: CashIcons.moneyIn)
            categories = [.init(title: Category.salary.rawValue, icon: .bank),
                          .init(title: Category.loan.rawValue, icon: .moneyIn),
                          .init(title: Category.freelancer.rawValue, icon: .idea)]
        } else {
            title = "Añade tu nuevo gasto"
            transactionType = "Gasto"
            transactionPlaceholder = "Nuevo Gasto"
            icon = .dollarOut
            colorTexts = .red
            category = .init(title: CashSwitchboard.Category.cash.rawValue, icon: CashIcons.moneyOut)
            categories = [.init(title: Category.cash.rawValue, icon: .moneyOut),
                          .init(title: Category.debit.rawValue, icon: .debitCard),
                          .init(title: Category.credit.rawValue, icon: .creditCard)]
        }
        
        subtitle = "Añade el monto de tu \(transactionType), elige una categoría y escribe una descripción tan detallada como desees."
    }
    
    private func convertToCategory() -> CashSwitchboard.Category {
        .init(rawValue: category.title) ?? .cash
    }
}
