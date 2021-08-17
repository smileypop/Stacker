//
//  UserModel.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import Foundation
import SwiftUI
import Kingfisher

enum BadgeType {
    case bronze, silver, gold
}

struct UserModel: Codable, Identifiable {
    
    // Use a sub struct for decoding
    struct BadgeCounts: Codable {
        var bronze: Int
        var silver: Int
        var gold: Int
    }
    
    private var userId: Int //user_id
    var id: Int {
        userId // name as 'id' to conform to Identifiable protocol
    }
    var displayName: String // display_name
    var reputation: Int // reputation
    var badgeCounts: BadgeCounts // badge_counts
    var websiteUrl: String // website_url
    private var location: String? // location
    var locationName: String {
        location ?? ""
    }
    var link: String // link
    private var creationDate: Int // creation_date
    var joinDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let epochTime = TimeInterval(creationDate)
        let date = Date(timeIntervalSince1970: epochTime)
        return formatter.string(from: date)
    }
    private var profileImage: String // profile_image
    var image: KFImage {
        KFImage.url(URL(string: profileImage)!).placeholder {
            // use placeholder user image until remote image is loaded
            Image("user")
        }
    }
}
