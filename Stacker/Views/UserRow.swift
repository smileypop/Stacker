//
//  UserRow.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import SwiftUI
import Kingfisher

struct UserRow: View {
    
    var user: UserModel
    
    var body: some View {
        HStack {
            user.image.resizable().frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Text(user.displayName).font(.system(size: 14))
                    Spacer()
                }
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
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("N/A")
    }
}
