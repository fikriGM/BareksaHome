//
//  ImbalChartDataEntity.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ImbalChartDataEntity: Codable {

    var KI002MMCDANCAS00: ChartDataEntity
    var NI002EQCDANSIE00: ChartDataEntity
    var TP002EQCEQTCRS00: ChartDataEntity
    
    
    init(KI002MMCDANCAS00: ChartDataEntity,
         NI002EQCDANSIE00: ChartDataEntity,
         TP002EQCEQTCRS00: ChartDataEntity) {
        self.KI002MMCDANCAS00 = KI002MMCDANCAS00
        self.NI002EQCDANSIE00 = NI002EQCDANSIE00
        self.TP002EQCEQTCRS00 = TP002EQCEQTCRS00
    }
    
}
