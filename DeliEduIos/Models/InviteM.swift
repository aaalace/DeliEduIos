import Foundation

struct InviteM: Codable, Identifiable {
    var id: Int32
    var userId: Int32
    var authorName: String
    var city: String
    var dt: String
    var description: String
    var contacts: String
}
