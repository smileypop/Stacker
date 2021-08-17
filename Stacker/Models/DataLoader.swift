//
//  DataLoader.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import SwiftUI

// Remove JSON object includes a sub array named "items"
struct DataResponse: Codable {
    var items: [UserModel]
}

class DataLoader: ObservableObject {
    
    let remotePath: String = "https://api.stackexchange.com/2.2/users?site=stackoverflow"
    @Environment(\.managedObjectContext) private var viewContext
    @Published public var users: [UserModel] = [] {
        didSet {
            // TODO: save to CoreData
        }
    }
    
    func getUsersFromLocal() {
        let data: Data
        guard let file = Bundle.main.url(forResource: "data.json", withExtension: nil)
        else {
            fatalError("Couldn't find users in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load users from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            users = try decoder.decode([UserModel].self, from: data)
        } catch {
            fatalError("Couldn't parse users as \([UserModel].self):\n\(error)")
        }
    }
    
    func getUsersFromServer(onComplete: @escaping () -> Void ) {
        guard let url = URL(string: remotePath) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // converts "property_name" into "propertyName"
            if let userData = try? decoder.decode(DataResponse.self, from: data!) {
                DispatchQueue.main.async {
                    // update the list object
                    self.users = userData.items
                    onComplete()
                }
            } else {
                // Perform callback without modifying the list
                onComplete()
            }
        }
        .resume()
    }
}
