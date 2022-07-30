//
//  ImbalHasilViewModel.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import Combine

class ImbalHasilViewModel: BaseViewModel {
    
    var apiResponse: ImbalDataResponse?
    
    init() {
        
        let repository = ImbalRepositoryIMP(remote: ImbalDataTypeRemoteService())
        
        let imbalTypeUseCase = ImbalTypeUseCase()
        imbalTypeUseCase.fetchImbalDataDetail = FetchImbalDataDetailUseCase(repository: repository)
        super.init(useCase: imbalTypeUseCase)
    }
    
    override init(useCase: BaseViewModel.U) {
        super.init(useCase: useCase)
    }
    
    @available(iOS 13.0, *)
    func fetchData() -> Future<Response?, ErrorResponse>? {
        let viewModelUsesCase = self.useCase as! ImbalTypeUseCase
        self.isLoading = true
        self.showError = false
        
        return viewModelUsesCase.fetchImbalDataDetail?.start()
    }
    
    func handleResponse(response: ImbalDataResponse) {
        debugPrint("Response :> \(response.code)")
    }
}
