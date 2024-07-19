import Foundation

struct AuthApi {
    static let baseUrl = "http://158.160.166.66:8000" + "/users"
    static let loginUrl = baseUrl + "/login"
    static let registerUrl = baseUrl + "/register"
    
    static func login(email: String, password: String) async throws -> Bool {
        guard let url = URL(string: loginUrl) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpBody = try JSONSerialization.data(withJSONObject: [email, password], options: [])
        
        let (_, _) = try await URLSession.shared.data(for: request)
        
        return true
    }
    
    static func register(email: String, password: String, name: String, city: String) async throws -> Bool {
        guard let url = URL(string: registerUrl) else {
            return false
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try JSONSerialization.data(withJSONObject: [email, password, name, city], options: [])
        
        let (_, _) = try await URLSession.shared.data(for: request)
        
        return true
    }
}
