//
//  IPTVModel.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 18/12/2024.
//

import Foundation

struct IPTV: Codable, Identifiable {
    var id = UUID() // Unique ID pour chaque IPTV
    var name: String
    var url: String
    var username: String
    var password: String
}
