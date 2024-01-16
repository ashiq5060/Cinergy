//
//  MovieInfoModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation

struct MovieResponseModel: Decodable {
    let response: String
    let movieInfo: MovieInfo
    
    struct MovieInfo: Decodable {
        let scheduledFilmId: String
        let title: String
        let runTime: String
        let imageUrl: String
        let showTimes: [ShowTime]
        let dateList: [String]
    

        enum CodingKeys: String, CodingKey {
            case scheduledFilmId = "ScheduledFilmId"
            case title = "Title"
            case runTime = "RunTime"
            case imageUrl = "image_url"
            case showTimes = "show_times"
            case dateList = "date_list"
        }
    }

    struct ShowTime: Decodable {
        let date: String
        let sessions: [Session]
    }

    struct Session: Decodable {
        let showtime: String

        enum CodingKeys: String, CodingKey {
            case showtime = "Showtime"
        }
    }
}
