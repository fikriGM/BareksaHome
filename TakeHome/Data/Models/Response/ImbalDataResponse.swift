//
//  ImbalDataResponse.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ImbalDataResponse: Response {
    var code: Int
    var message, error: String
    var data: [ImbalHasilEntity]
    
    init(code: Int, message: String, error: String, data: [ImbalHasilEntity]) {
        self.code = code
        self.message = message
        self.error = error
        self.data = data
    }
}
