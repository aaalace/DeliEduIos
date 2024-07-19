import SwiftUI

struct RegistrationV: View {
    @EnvironmentObject var authManager: AuthManager
    
    @State private var loginEmail = "";
    @State private var loginPassword = "";
    
    @State private var registerEmail = "";
    @State private var registerPassword = "";
    @State private var registerName = "";
    @State private var registerCity = "";
    
    @State private var authState = true;

    var body: some View {
        ScrollView {
            Text("DeliEdu")
                .font(.largeTitle)
                .padding(.bottom, 10)
                .padding(.top, 30)
                .foregroundColor(.green)
            if (!authState) {
                Text("error")
                    .foregroundColor(Color(.green))
            }
            VStack (alignment: .leading) {
                Text("Login")
                    .font(.title2)
                    .padding(.bottom, 12)
                VStack (alignment: .trailing) {
                    TextField("Email", text: $loginEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 12)
                    SecureField("Password", text: $loginPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 12)
                    Button("Sign In") {
                        DispatchQueue.main.async {
                            Task {
                                authState = await authManager.login(loginEmail: loginEmail,
                                                        loginPassword: loginPassword)
                                authManager.isAuth = authState
                            }
                        }
                    }
                    .padding(10)
                    .padding(.horizontal, 15)
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color(red: 0.95, green: 0.95, blue: 0.95)))
                    .foregroundColor(.green)
                }
                .padding(.bottom, 25)
                
                Text("Register")
                    .font(.title2)
                    .padding(.bottom, 12)
                VStack (alignment: .trailing) {
                    TextField("Email", text: $registerEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 12)
                    SecureField("Password", text: $registerPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 12)
                    TextField("Name", text: $registerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 12)
                    TextField("City", text: $registerCity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 12)
                    Button("Sign Up") {
                        DispatchQueue.main.async {
                            Task {
                                authState = await authManager.register(registerEmail: registerEmail,
                                                                          registerPassword: registerPassword,
                                                                          registerName: registerName,
                                                                          registerCity: registerCity)
                            }
                        }
                    }
                    .padding(10)
                    .padding(.horizontal, 15)
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color(red: 0.95, green: 0.95, blue: 0.95)))
                    .foregroundColor(.green)
                }
            }
            .padding([.horizontal, .top], 40)
        }
    }
}

#Preview {
    RegistrationV()
}
