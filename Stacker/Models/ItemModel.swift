//
//  ItemModel.swift
//  Stacker
//
//  Created by Matthew on 8/16/21.
//

// Sample CoreData object for testing

import Foundation

struct ItemModel: Codable {
    var timestamp: Date?

    enum CodingKeys: String, CodingKey {
        case timestamp = "Timestamp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try values.decode(Date.self, forKey: .timestamp)
    }
}
