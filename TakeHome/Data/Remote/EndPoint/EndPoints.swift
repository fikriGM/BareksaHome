//
//  EndPoints.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

struct EndPoints {
    
    static let endPointApp = "/takehometes/apps/compare"
    
    /// will be responsible for holding the end points name
    /// also will help to separate the endpoints by its controller/feature
    struct ImbalTypes {
        
        static let endPointDetail = "/detail"
        static let endPointChart = "/chart"
        
        static var dataDetail: String { get { return "\(endPointApp)\(endPointDetail)" } }
        static var dataChart: String { get { return "\(endPointApp)\(endPointChart)" } }
    }
}

