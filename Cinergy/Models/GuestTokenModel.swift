//
//  GuestTokenModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 15/01/24.
//

struct GuestTokenResponse: Codable {
    let response: String
    let token: String

    enum CodingKeys: String, CodingKey {
        case response, token
    }
}
