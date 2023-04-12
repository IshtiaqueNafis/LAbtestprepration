//
//  PostViewModel.swift
//  LAbtestprepration
//
//  Created by user231178 on 4/12/23.
//

import Foundation

class PostViewModel:ObservableObject{
    @Published var posts: [Post] = []
    
    func fetchItems() {
            // Make API request and decode the response
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let decodedResponse = try? decoder.decode([Post].self, from: data) {
                        DispatchQueue.main.async {
                            self.posts = decodedResponse
                        }
                        return
                    }
                }
                print("Error fetching items")
            }.resume()
        }
    
}
