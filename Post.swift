//
//  Post.swift
//  LAbtestprepration
//
//  Created by user231178 on 4/12/23.
//

import Foundation
struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String?
    
}
