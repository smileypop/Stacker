//
//  CircleImage.swift
//  Stacker
//
//  Created by Matthew on 8/15/21.
//

// Custom Circle Image for profile avatars

import SwiftUI
import Kingfisher

struct CircleImage: View {
    var image: KFImage
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: DataLoader().users[0].image)
    }
}
