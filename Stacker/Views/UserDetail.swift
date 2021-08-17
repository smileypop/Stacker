//
//  UserDetail.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import SwiftUI
import Kingfisher

struct UserDetail: View {
    
    var user: UserModel
    
    var body: some View {
        ScrollView {
            
            Rectangle().fill(Color("gold")).ignoresSafeArea(edges: .top)
                .frame(height: 128)
            VStack(alignment: .center) {
                CircleImage(image: user.image)
                Text(user.displayName)
                    .font(.title2).padding()
                
                HStack {
                    Image(systemName: "r.circle.fill").resizable().frame(width: 16, height: 16, alignment: .center)
                    Text(String(user.reputation)).bold().font(.system(size: 12)).fixedSize()
                        .frame(width: 50, height: 14, alignment: .leading)
                    Circle().fill(Color("gold")).frame(width: 16, height: 16).padding(.leading, 10)
                    Text(String(user.badgeCounts.gold)).font(.system(size: 12)).fixedSize()
                        .frame(width: 25, height: 14, alignment: .leading)
                    Circle().fill(Color("silver")).frame(width: 16, height: 16).padding(.leading, 10)
                    Text(String(user.badgeCounts.silver)).font(.system(size: 12)).fixedSize()
                        .frame(width: 25, height: 14, alignment: .leading)
                    Circle().fill(Color("bronze")).frame(width: 16, height: 16).padding(.leading, 10)
                    Text(String(user.badgeCounts.bronze)).font(.system(size: 12)).fixedSize()
                        .frame(width: 25, height: 14, alignment: .leading)
                }
                
                HStack {
                    Text(user.locationName)
                    Spacer()
                    Text("join-date \(user.joinDate)")
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding()
                
                Divider()
                
                HStack {
                    Link(destination: URL(string: user.link)!) {
                        Image(systemName: "person.circle.fill")
                            .font(.title3)
                        Text("user-page")
                    }
                    Spacer()
                    Link(destination: URL(string: user.websiteUrl)!) {
                        Image(systemName: "link.circle.fill")
                            .font(.title3)
                        Text("home-page")
                    }
                }
            }
            .offset(x: 0, y: -92)
            .padding()
        }.navigationTitle("user-profile")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        Text("N/A")
    }
}

