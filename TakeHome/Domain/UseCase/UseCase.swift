//
//  UseCase.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import Foundation
import Combine

protocol UseCase {
    
}

@available(iOS 13.0, *)
protocol SingleUseCase {
    func start() -> Future<Response?, ErrorResponse>
}
