
import Foundation
import SwiftUI

public protocol CashInOutViewModelProtocol: ObservableObject {
    
    // MARK: - Initializer
    
    init(configuration: CashInOutConfigurationProtocol, bundleMainApp: Bundle)
}

public protocol CashInOutConfigurationProtocol: AnyObject {
    
    // MARK: - Properties
    
    var config: [String: AnyObject] { get set }
}

public protocol CashInOutCoordinatorProtocol: ObservableObject {

    // MARK: - Properties

    var path: NavigationPath { get set }

    // MARK: - Functions

    init(path: NavigationPath, configuration: CashInOutConfigurationProtocol, bundleMainApp: Bundle?)
    func push(page: CashInOutPage)
    func popToRoot()
    func pop()
    
    associatedtype view: View
    func build(page: CashInOutPage) -> view
}