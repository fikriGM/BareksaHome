//
//  FetchImbalDataDetailUseCase.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Combine

class FetchImbalDataDetailUseCase: SingleUseCase {
    
    let repositoryImbalDomain: ImbalDomainTypeRepository
    
    init(repository: ImbalDomainTypeRepository) {
        self.repositoryImbalDomain = repository
    }
    
    @available(iOS 13.0, *)
    func start() -> Future<Response?, ErrorResponse> {
        
        Future { [weak self] promise in
            self?.repositoryImbalDomain.getDataDetailImbalDomain { result, error in

                if result != nil {
                    promise(Result.success(result))
                } else {
                    promise(Result.failure(error!))
                }
            }
            
        }
    }
    
    
    
}
