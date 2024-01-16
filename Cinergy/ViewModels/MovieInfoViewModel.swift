//
//  MovieInfoViewModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation
import Alamofire

class MovieInfoViewModel {
    
    func fetchEscapeRoom(movieId: String,completion: @escaping (Result<MovieResponseModel, Error>) -> Void) {
      
        let url = APIConstants.baseURL + APIConstants.Endpoints.getMovieInfoEndpoint
        let headers = APIClientHelper.createHeaders()
        
        let parameters: Parameters = [
            "device_id": UIDevice.uniqueDeviceId,
            "device_type": "2",
            "movie_id": movieId,
            "location_id": "5",
        ]
        
        
        APIClientHelper.performRequest(url: url, parameters: parameters, headers: headers) { (result: Result<MovieResponseModel, Error>) in
            
            switch result {
            case .success(let movieResponse):
                print("JSON Response: \(movieResponse.movieInfo)")
                completion(.success(movieResponse))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

