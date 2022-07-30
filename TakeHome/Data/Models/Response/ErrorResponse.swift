//
//  ErrorResponse.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import Foundation

struct ErrorResponse: Encodable, Error {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
