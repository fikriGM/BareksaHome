//
//  ImbalHasilEntity.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ImbalHasilEntity: Codable {
    var code: String
    var name: String
    var details: DetailImbalEntity
    
    init(code: String, name: String , details: DetailImbalEntity) {
        self.code = code
        self.name = name
        self.details = details
    }
}
