//
//  PerbandinganViewModel.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/31/22.
//

import Foundation
import Combine

class PerbandinganViewModel: BaseViewModel {
    
    var apiResponse: ImbalDataResponse?
    var apiChartResponse: ImbalChartResponse?
    
    init() {
        
        let repository = ImbalRepositoryIMP(remote: ImbalDataTypeRemoteService())
        
        let imbalTypeUseCase = ImbalTypeUseCase()
        imbalTypeUseCase.fetchImbalDataDetail = FetchImbalDataDetailUseCase(repository: repository)
        imbalTypeUseCase.fetchImbalChart = FetchImbalChartUseCase(repository: repository)
        
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
    
    @available(iOS 13.0, *)
    func fetchDataChart() -> Future<Response?, ErrorResponse>? {
        let viewModelChartUseCase = self.useCase as! ImbalTypeUseCase
        self.isLoading = true
        self.showError = false
        
        return viewModelChartUseCase.fetchImbalChart?.start()
    }
    
    var currentCount: Int {
        get {
            self.apiResponse?.data.count ?? 0
        }
    }
    
    func handleResponse(response: ImbalDataResponse) {
        self.apiResponse = response
        debugPrint("Response :> \(response)")
    }
    
}
