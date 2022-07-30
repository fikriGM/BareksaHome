//
//  BaseNetwork.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Alamofire
import Combine

// MARK: - Generic base networking class that will send request to the server and parse the response
class BaseNetworking {
    
    // MARK: Shared Instance
    public static let shared: BaseNetworking = BaseNetworking()
    
    func request<T: Codable>(_ t: T.Type, endPoint: API, completion: @escaping (_ result: T?, _ error: ErrorResponse?) -> Void) {
        
        let url = buildRequestURL(endPoint: endPoint)
        
        print("URLRequest :> \(url)")
        if (url != nil) {
            ///herer we will call our API
            ///if it's sucess then return the object after parsing
            ///if it's failure then return error object
            
            AF.request(url!, method: endPoint.method, encoding: endPoint.bodyEncoding).validate().responseDecodable(of: T.self) {
                (response) in
                debugPrint(response)
                switch response.result {
                case .success(_):
                    guard let response = response.value else {
                        completion(nil, ErrorResponse(message: "Could not parse the object"))
                        return
                    }
                    debugPrint(response)
                    completion(response, nil)
                    
                case .failure(let error):
                    debugPrint("error => ",error.localizedDescription)
                    completion(nil, ErrorResponse(message: "Could not connect to the server, please try again"))
                }
            }
        } else {
            completion(nil, ErrorResponse(message: "There is somethign wrong with requested URL"))
        }
    }
    
    //MARK: in order to handle the get request with any query parameters
    private func buildRequestURL(endPoint: API) -> URL? {
        
        let env = AppEnvironment.current
      
        var components = URLComponents()
        components.scheme = "https"
        components.host = env.baseURL
        components.path = endPoint.path
        if #available(iOS 11.0, *) {
            components.percentEncodedQueryItems = [
                URLQueryItem(name: "productCodes", value: "KI002MMCDANCAS00&productCodes=TP002EQCEQTCRS00&productCodes=NI002EQCDANSIE00")
            ]
        }

        return components.url
    }
    
}
