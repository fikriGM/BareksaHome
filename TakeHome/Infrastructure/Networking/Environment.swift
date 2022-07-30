//
//  Environment.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

public enum Environment {
    case develoment
    case live
    
    var baseURL: String {
        switch self {
        case .develoment:
            return "ae1cdb19-2532-46fa-9b8f-cce01702bb1e.mock.pstmn.io"
        case .live:
            //for now we don't have any live url
            return "ae1cdb19-2532-46fa-9b8f-cce01702bb1e.mock.pstmn.io"
        }
    }
}
