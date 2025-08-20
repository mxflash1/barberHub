import Foundation
import SwiftUI

struct Client: Identifiable, Hashable {
    let id: UUID
    var name: String
    var phone: String
    var notes: String
    var beforePhoto: UIImage?
    var afterPhoto: UIImage?

    init(id: UUID = UUID(), name: String, phone: String = "", notes: String = "", beforePhoto: UIImage? = nil, afterPhoto: UIImage? = nil) {
        self.id = id
        self.name = name
        self.phone = phone
        self.notes = notes
        self.beforePhoto = beforePhoto
        self.afterPhoto = afterPhoto
    }
} 