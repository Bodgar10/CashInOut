import SwiftUI
import SwiftData
import CashInOut
import CashSwitchboard
import Common

@main
struct DemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let modelContext = ModelContainerProvider.shared.mainContext
    
    var body: some Scene {
        WindowGroup {
            CashInOutCoordinator(modelContext: modelContext, type: "CashOut").start()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        ServiceLocator.register(NavigationService.self, factory: MockNavigationService())
        return true
    }
}


public class MockNavigationService: NavigationService {
    public var id = UUID()
    
    public func navigate(to destination: Common.Destination) {
        print("NAVIGATE TO: \(destination)")
    }
}


class ModelContainerProvider {
    static let shared: ModelContainer = {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: false)
            let container = try ModelContainer(for: CashSwitchboard.Transaction.self, configurations: configuration)
            return container
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }()
}
