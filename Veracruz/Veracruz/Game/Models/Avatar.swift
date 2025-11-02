//
//  Avatar.swift
//  Veracruz
//
//  Created by Amarjit on 02/11/2025.
//

import Foundation

enum AvatarResource: String, CaseIterable {
    case avt1 = "avt-1"
    case avt2 = "avt-2"
    case avt3 = "avt-3"
    case avt4 = "avt-4"
    case avt5 = "avt-5"
}

// Avatar model
struct Avatar {
    let name: String
    let resourceFile: AvatarResource
}
