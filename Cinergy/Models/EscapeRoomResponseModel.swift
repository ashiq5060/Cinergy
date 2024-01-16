//
//  escapeRoomResponseModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation

struct EscapeRoomResponseModel: Decodable {
    let response, erTickets: String
    let escapeRoomsMovies: [EscapeRoomsMovie]
    
    enum CodingKeys: String, CodingKey {
        case response
        case erTickets = "er_tickets"
        case escapeRoomsMovies = "escape_rooms_movies"
    }
}

// MARK: - EscapeRoomsMovie
struct EscapeRoomsMovie: Codable {
    let id, scheduledFilmID, slug, title: String
    let rating, runTime, synopsis: String
    let imageURL: String
    let imageURLPoster: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case scheduledFilmID = "ScheduledFilmId"
        case slug
        case title = "Title"
        case rating = "Rating"
        case runTime = "RunTime"
        case synopsis = "Synopsis"
        case imageURL = "image_url"
        case imageURLPoster = "image_url_poster"
    }
}
