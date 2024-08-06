
import Combine
import Foundation
import SwiftUI

public class CashInOutViewModel: CashInOutViewModelProtocol {

    // MARK: - Properties

    private let configuration: CashInOutConfigurationProtocol
    private let bundleMainApp: Bundle

    // MARK: - Initializer

    public required init(configuration: CashInOutConfigurationProtocol, bundleMainApp: Bundle) {
        self.configuration = configuration
        self.bundleMainApp = bundleMainApp
    }
}