//
//  ChartDataEntity.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ChartDataEntity: Codable {
    var data: [ChartsDataEntity]?
    var error: String
    
    init(data: [ChartsDataEntity], error: String) {
        self.data = data
        self.error = error
    }
    
}
