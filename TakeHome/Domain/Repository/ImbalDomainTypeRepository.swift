//
//  ImbalDomainTypeRepository.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

protocol ImbalDomainTypeRepository {
    
    func getDataDetailImbalDomain(completion: @escaping (_ result: Response?, _ error: ErrorResponse?) -> Void)
    
    func getChartImbalDomain(completion: @escaping(_ result: Response?, _ error: ErrorResponse?) -> Void)
}
