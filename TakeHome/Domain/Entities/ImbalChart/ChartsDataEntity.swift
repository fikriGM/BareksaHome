//
//  ChartsDataEntity.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ChartsDataEntity: Codable {
    var date: String
    var value: Float
    var growth: Double?
    
    init(date: String, value: Float, growth: Double) {
        self.date = date
        self.value = value
        self.growth = growth
    }
    
}
