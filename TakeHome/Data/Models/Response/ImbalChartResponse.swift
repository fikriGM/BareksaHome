//
//  ImbalChartResponse.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ImbalChartResponse: Response {
    var code: Int
    var message: String?
    var error: String
    var data: ImbalChartDataEntity?
    var total_data: Int
    
    init(code: Int, message: String, error: String, data: ImbalChartDataEntity, total_data: Int) {
        self.code = code
        self.message = message
        self.error = error
        self.data = data
        self.total_data = total_data
    }
    
  
}
