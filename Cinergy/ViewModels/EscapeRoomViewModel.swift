//
//  escapeRoomViewModels.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation
import Alamofire

class EscapeRoomViewModel {
    var loginResponse: LoginResponse?
    
    func fetchEscapeRoom(completion: @escaping (Result<EscapeRoomResponseModel, Error>) -> Void) {
      
        let url = APIConstants.baseURL + APIConstants.Endpoints.escapeRoomMoviesEndpoint
       
        let headers = APIClientHelper.createHeaders()
        
        let parameters: Parameters = [
            "device_id": UIDevice.uniqueDeviceId,
            "device_type": "2",
            "member_id": loginResponse?.user.memberId ?? "",
            "location_id": "2",
        ]
        
        
        APIClientHelper.performRequest(url: url, parameters: parameters, headers: headers) { (result: Result<EscapeRoomResponseModel, Error>) in
            
            switch result {
            case .success(let escapeRoomResponse):
                completion(.success(escapeRoomResponse))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
