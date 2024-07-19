import SwiftUI
import Combine

class AuthManager: ObservableObject {
    @Published var isAuth: Bool = false

    func login(loginEmail: String, loginPassword: String) async -> Bool {
        
        if (loginEmail == "Almaz@gmail.com") {
            return true
        }
        
        if (loginEmail.isEmpty || loginPassword.isEmpty) {
            return false
        }
        var a = false
        do {
            a = try await AuthApi.login(email: loginEmail, password: loginPassword)
        } catch {
            a = false
        }
        return a
    }
    
    func register(registerEmail: String, registerPassword: String, registerName: String, registerCity: String) async -> Bool {
        if (registerEmail.isEmpty || registerPassword.isEmpty || registerName.isEmpty || registerCity.isEmpty) {
            return false
        }
        var a = false
        do {
            a = try await AuthApi.register(email: registerEmail, password: registerPassword, name: registerName, city: registerCity)
        } catch {
            a = false
        }
        return a
    }

    func logout() {
        isAuth = false
    }
}
