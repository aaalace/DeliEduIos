import SwiftUI

@main
struct DeliEduIosApp: App {
    @ObservedObject private var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(authManager)
        }
    }
}
