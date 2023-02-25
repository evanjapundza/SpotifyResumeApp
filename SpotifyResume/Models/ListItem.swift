//
//  ListItem.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/23/23.
//

import Foundation


struct ListItem: Hashable {
    let company: String
    let type: String
    let title: String
    let date: String
    let image: String
    
    let descriptions: [String]
}
