import Foundation

struct InviteApi {
    static let baseUrl = "http://158.160.166.66:8000" + "/invites"
    static let getInvitesUrl = baseUrl
    
    static func getInvites() async throws -> [InviteM] {
        guard let url = URL(string: getInvitesUrl) else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([InviteM].self, from: data)
    }
}
