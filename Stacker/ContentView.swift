//
//  ContentView.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var dataLoader = DataLoader()

    var body: some View {
        UserList().environmentObject(dataLoader)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
