//
//  API.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Alamofire

//MARK: - API class will help to define the APIs in the remote networking when calling from the server

public class API {
    public let path: String
    public let method: HTTPMethod
    public let headerParametes: [String: String]
    public let queryParameters: [String: Any]
    public let bodyParameters: [String: Any]
    public let bodyEncoding: ParameterEncoding
    
    init(path: String,
         method: HTTPMethod,
         headerParameter: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParamatersEncodable: Encodable? = nil,
         bodyParameters: [String: Any] = [:],
         bodyEncoding: ParameterEncoding = URLEncoding.default) {
        self.path = path
        self.method = method
        self.headerParametes = headerParameter
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.bodyEncoding = bodyEncoding
    }
}
