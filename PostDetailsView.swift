//
//  PostDetailsView.swift
//  LAbtestprepration
//
//  Created by user231178 on 4/12/23.
//

import SwiftUI

struct PostDetailsView: View {
    let post:Post
    
    var body: some View {
        VStack{
            Text(post.title)
            Text(post.body ?? "test")
        }
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(post: Post(id: 1, title:"test", body: "test"))
    }
}
