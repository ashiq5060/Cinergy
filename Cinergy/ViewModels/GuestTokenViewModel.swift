//
//  GuestTokenViewModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 15/01/24.
//

import Foundation
import Alamofire

class GuestTokenViewModel {
    
    
    func fetchGuestToken(completion: @escaping (Result<String, Error>) -> Void) {
        
        
        let url = APIConstants.baseURL + APIConstants.Endpoints.guestTokenEndpoint
        
        let headers = APIClientHelper.createHeaders()
        
        let parameters: Parameters = [
            "secret_key": "402620C92552D9303C58B901B43B0A41718E772C19520DD9A9AA52CE5A8FCB99",
            "device_type": "2",
            "device_id": UIDevice.uniqueDeviceId,
            "push_token": ""
        ]
        
        APIClientHelper.performRequest(url: url, parameters: parameters, headers: headers) { (result: Result<GuestTokenResponse, Error>) in
            
            switch result {
            case .success(let guestTokenResponse):
                APIClientHelper.authToken = guestTokenResponse.token
                completion(.success(guestTokenResponse.token))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
