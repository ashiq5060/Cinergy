//
//  LoginResponseModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation

struct LoginResponse: Codable {
    let response: String
    let user: User

    struct User: Codable {
        let memberId: String?
        let userId: Int?
        
        enum CodingKeys: String, CodingKey {
            case memberId = "memberId"
            case userId = "id"
        }
    }
}
