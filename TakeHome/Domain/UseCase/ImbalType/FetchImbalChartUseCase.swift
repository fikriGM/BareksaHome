//
//  FetchImbalChartUseCase.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Combine

class FetchImbalChartUseCase: SingleUseCase {
   
    let repository: ImbalDomainTypeRepository
    
    init(repository: ImbalDomainTypeRepository) {
        self.repository = repository
    }
    
    @available(iOS 13.0, *)
    func start() -> Future<Response?, ErrorResponse> {
        Future { [weak self] promise in
            self?.repository.getChartImbalDomain { result , error in
                
                if result != nil {
                    promise(Result.success(result))
                } else {
                    promise(Result.failure(error!))
                   
                }
                debugPrint(result)
                debugPrint(error)
            }
        }
    }
}

