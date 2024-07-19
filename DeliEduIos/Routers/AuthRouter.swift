import SwiftUI

class AppRouter: ObservableObject {
    @Published var currentView: AnyView?

    func navigateToLogin() {
        currentView = AnyView(RegistrationV())
    }

    func navigateToDashboard() {
        currentView = AnyView(DashboardV())
    }
}
