//
//  ImbalDataSource.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Alamofire

protocol ImbalDataSource {
    
    //Get Data Detail Imbal
    func getImbalData(completion: @escaping(_ result: ImbalDataResponse? , _ error: ErrorResponse?) -> Void)
    
    //Get Chart Imbal
    func getImbalChartData(completion: @escaping(_ result: ImbalChartResponse?, _ error: ErrorResponse?) -> Void)
}
