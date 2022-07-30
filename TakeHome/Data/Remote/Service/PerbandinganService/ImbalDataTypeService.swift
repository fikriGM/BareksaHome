//
//  ImbalDataTypeService.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct ImbalDataTypeRemoteService: ImbalDataSource {
    
    //MARK: GET DATA IMBAL
    func getImbalData(completion: @escaping (ImbalDataResponse?, ErrorResponse?) -> Void) {
        let even = API(path: EndPoints.ImbalTypes.dataDetail, method: .get)
        
        //here we call the request with our type and completion handler
        BaseNetworking.shared.request(ImbalDataResponse.self, endPoint: even, completion: completion);
    }
    
    //MARK: GET DATA CHART
    func getImbalChartData(completion: @escaping (ImbalChartResponse?, ErrorResponse?) -> Void) {
        let event = API(path: EndPoints.ImbalTypes.dataChart, method: .get)
        
        //here we call the request with our type and completion handler
        BaseNetworking.shared.request(ImbalChartResponse.self, endPoint: event, completion: completion);
    }
}
