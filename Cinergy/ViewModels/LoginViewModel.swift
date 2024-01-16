//
//  LoginViewModel.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation
import Alamofire


class LoginViewModel {
    
    func loginUser( completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let url = APIConstants.baseURL + APIConstants.Endpoints.loginEndpoint
        
        let headers = APIClientHelper.createHeaders()
        
        let parameters: Parameters = [
            "device_id": UIDevice.uniqueDeviceId,
            "device_type": "2",
            "email": "",
            "login_type": "2",
            "password": ""
        ]
        
        APIClientHelper.performRequest(url: url, parameters: parameters, headers: headers) { (result: Result<LoginResponse, Error>) in
            
            switch result {
            case .success(let loginResponse):
                APIClientHelper.userid = String(loginResponse.user.userId ?? 0)
                completion(.success(loginResponse))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
