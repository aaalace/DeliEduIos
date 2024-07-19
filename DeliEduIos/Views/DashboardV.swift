import SwiftUI

struct DashboardV: View {
    @EnvironmentObject var authManager: AuthManager
    @State var invites: [InviteM] = []
    
    var body: some View {
        VStack {
            NavigationView () {
                List(invites) { invite in
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .top, spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(invite.authorName)")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(Color(.green))
                                Text("\(invite.city)")
                                    .font(.body)
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(invite.dt)")
                                    .font(.subheadline)
                                    .padding(.top, 7)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Description:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("\(invite.description)")
                                .font(.body)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Contacts:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("\(invite.contacts)")
                                .font(.body)
                        }
                    }
                    .foregroundColor(Color(UIColor.label))
                    .padding(20)
                    .listRowSeparator(.hidden)
                }
                .task {
                    do {
                        invites = try await InviteApi.getInvites()
                    } catch {
                        invites = invitesMock
                    }
                }
                .navigationTitle("Invites")
                .navigationBarItems(
                    trailing: Button ("Log out") {
                        authManager.logout()
                    }
                        .foregroundColor(.green)
                )
            }
            Link(destination: URL(string: "http://158.160.166.66:3000")!) {
                HStack {
                    Image(systemName: "globe")
                    Text("Open in web")
                }
                .padding(10)
                .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    DashboardV()
}			


let invitesMock = [
    InviteM(id: 1,
            userId: 1,
            authorName: "Almaz",
            city: "Moscow",
            dt: "20.08.2024 18:00",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            contacts: "tg: @aaalace\nph: 89872858202"),
    InviteM(id: 2,
            userId: 2,
            authorName: "Tigran",
            city: "Kazan",
            dt: "21.08.2024 16:00",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            contacts: "tg: @richardxz"),
    InviteM(id: 3,
            userId: 1,
            authorName: "Lera",
            city: "Moscow",
            dt: "10.09.2024 20:00",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            contacts: "tg: @lllera\nph: 89878987789"),
]
