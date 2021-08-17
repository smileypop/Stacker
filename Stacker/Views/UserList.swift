//
//  UserList.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import SwiftUI

struct UserList: View {
    
    @State private var isShowingAlert = false // toggle alert
    @State private var isShowingActions = false // toggle action sheet
    @State private var isLoading = false // toggle loading indicator
    @EnvironmentObject var dataLoader: DataLoader // manages user list
    
    var body: some View {
        NavigationView {
            if isLoading {
                VStack {
                    // show loading indicator
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                }.navigationBarTitle("nav-bar-title", displayMode: .inline)
            } else {
                List(dataLoader.users) { user in
                    NavigationLink(
                        destination: UserDetail(user: user))
                    {
                        UserRow(user: user)
                    }
                }.navigationBarTitle("nav-bar-title", displayMode: .inline)
                .toolbar {
                    // Option to change data source
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {
                            isShowingActions = true
                        }) {
                            Image(systemName: "arrow.down.doc.fill")
                        }
                    }
                }
            }
        }
        .onAppear() {
            isLoading = true
            // Try server data first
            dataLoader.getUsersFromServer() {
                isLoading = false
            }
        }
        .actionSheet(isPresented: $isShowingActions)  {
            // Show options for data sources
            ActionSheet(title: Text("action-sheet-title"), message: Text("action-sheet-message"), buttons: [
                .default(Text("server-data")) {
                    isLoading = true
                    dataLoader.getUsersFromServer() {
                        isLoading = false
                    }
                },
                .default(Text("local-data")) {
                    isLoading = true
                    // Fake loading time
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isLoading = false
                        // Pull data from JSON
                        dataLoader.getUsersFromLocal()
                    }
                },
                .default(Text("core-data")) {
                    // TODO: add Core Data, show alert for now
                    isShowingAlert = true
                },
                .cancel()
            ])
        }
        .alert(isPresented: $isShowingAlert) {
            // TODO: add Core Data
            Alert(title: Text("alert-title"), message: Text("alert-message"))
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
