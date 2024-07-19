import SwiftUI

struct AppRootView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        if authManager.isAuth {
            DashboardV()
        } else {
            RegistrationV()
        }
    }
}
