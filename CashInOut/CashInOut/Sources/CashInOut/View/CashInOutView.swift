
import Foundation
import SwiftUI

public struct CashInOutView<VM>: View where VM: CashInOutViewModelProtocol {

    // MARK: - Properties

    @ObservedObject var viewModel: VM

    // MARK: - Initialize

    public init( viewModel: VM) {
        self.viewModel = viewModel    
    }

    public var body: some View {
        Text("CashInOut View")
    }
}

struct CashInOutView_Previews: PreviewProvider {
    static var previews: some View {
        CashInOutView(viewModel: CashInOutViewModel(configuration: configMock(), bundleMainApp: .main))
    }
}

class configMock: CashInOutConfigurationProtocol {
    var config: [String : AnyObject] = ["Any" : "Any" as AnyObject]
}