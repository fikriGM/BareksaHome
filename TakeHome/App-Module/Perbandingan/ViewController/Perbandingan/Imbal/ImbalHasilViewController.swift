//
//  ImbalHasilViewController.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import UIKit
import Combine
import Foundation


@available(iOS 13.0, *)
class ImbalHasilViewController: BaseViewController<ImbalHasilViewModel> {
    
    var observer: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ImbalHasilViewModel()
        self.setupViewModelObsever()
    }

    func setupViewModelObsever() {
        if viewModel != nil {
            self.viewModel!.isLoading = true
            self.view.showLoader()
            
            //MARK: FETCH DATA CHART
           self.viewModel?.fetchDataChart()?.receive(on: DispatchQueue.main).sink(receiveCompletion: { [weak self] completion in
                self?.viewModel?.isLoading = false
                self?.view.hideLoad()
                
                switch completion {
                case .finished:
                    print("finish Calling data Chart")
                case .failure(let errorResponse):
                    self?.showAlert(title: "Error", message: errorResponse.message, completion: { [weak self] action in
                        if errorResponse.message.contains("Could not connect to the server") {
                            exit(0)
                        }else {
                            self?.dismiss(animated: true)
                        }
                    })
                }
            }, receiveValue: { [weak self] response in
                print("Response chart Successfully parsed with \(String(describing: response))")
                
                let modelChart = self?.viewModel
                if response != nil {
                    modelChart?.handleChartResponse(chartResponse: response as! ImbalChartResponse)
                }
                
                
            }).store(in: &observer)
            
            
            //MARK: FETCH DATA IMBAL
             self.viewModel!.fetchData()?.receive(on: DispatchQueue.main).sink(receiveCompletion: { [weak self] completion in
//                self?.viewModel?.isLoading = false
//                self?.view.hideLoad()
                
                switch completion {
                case .finished:
                    print("finish calling")
                case .failure(let error):
                    self?.showAlert(title: "Error", message: error.message, completion: { [weak self] action in
                        if error.message.contains("Could not connect to the server") {
                            exit(0)
                        }else {
                            self?.dismiss(animated: true)
                        }
                       
                    })
                }
            }, receiveValue: { [weak self] response in
                print("Response Successfully parsed with \(String(describing: response))")
                
                let model = self?.viewModel
                if response != nil {
                    model?.handleResponse(response: response as! ImbalDataResponse)
                   
                }
            }).store(in: &observer)
        }
    }
}
