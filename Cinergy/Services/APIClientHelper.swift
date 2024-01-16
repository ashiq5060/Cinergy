//
//  APIClientHelper.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import Foundation
import Alamofire

class APIClientHelper {
    
    static var authToken: String?
    static var userid: String?
    
    static func createHeaders() -> HTTPHeaders {
        
        var headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        if let authToken = authToken {
            headers["Authorization"] = "Bearer " + authToken
        }
        
        // Include additional headers only if authToken is not nil
        if let authToken = authToken {
            headers["accesstoken"] = "402620C92552D9303C58B901B43B0A41718E772C19520DD9A9AA52CE5A8FCB99"
            headers["userid"] = userid ?? "0"
        }
        
        return headers
    }
    
    static func performRequest<T: Decodable>(
        url: String,
        method: HTTPMethod = .post,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = JSONEncoding.default,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        // Show loading indicator
        LoadingIndicator.shared.startAnimating()
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseDecodable(of: T.self) { response in
                // Hide loading indicator
                LoadingIndicator.shared.stopAnimating()
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
