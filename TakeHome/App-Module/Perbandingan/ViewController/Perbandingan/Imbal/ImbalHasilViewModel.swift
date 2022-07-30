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
    
    func handleResponse(response: ImbalDataResponse) {
        debugPrint("Response :> \(response.code)")
    }
    
    func handleChartResponse(chartResponse: ImbalChartResponse) {
        debugPrint("Response Chart :> \(chartResponse)")
    }
}
