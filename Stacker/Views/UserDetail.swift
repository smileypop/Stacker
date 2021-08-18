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
                    if let link = user.userLink, let url = URL(string: link) {
                        Link(destination: url) {
                            Image(systemName: "person.circle.fill")
                                .font(.title3)
                            Text("user-page")
                        }} else {
                            Button(action: {}, label: {
                                Image(systemName: "person.circle.fill")
                                    .font(.title3)
                                Text("user-page")
                            }).disabled(true)
                        }
                    Spacer()
                    if let link = user.userWebsite, let url = URL(string: link) {
                        Link(destination: url) {
                            Image(systemName: "link.circle.fill")
                                .font(.title3)
                            Text("home-page")
                        }} else {
                            Button(action: {}, label: {
                                Image(systemName: "link.circle.fill")
                                    .font(.title3)
                                Text("home-page")
                            }).disabled(true)
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

