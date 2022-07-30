//
//  ImbalRepositoryIMP.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Alamofire

final class ImbalRepositoryIMP {
    
    private let remoteImbalDataSource: ImbalDataSource
    
    init(remote: ImbalDataSource) {
        self.remoteImbalDataSource = remote
    }
}

extension ImbalRepositoryIMP: ImbalDomainTypeRepository {
    func getDataDetailImbalDomain(completion: @escaping (Response?, ErrorResponse?) -> Void) {
        remoteImbalDataSource.getImbalData(completion: completion)
    }
    
    
    
    
}
