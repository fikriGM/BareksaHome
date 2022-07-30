//
//  AppEnvironment.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation

public class AppEnvironment {
    
    public static var current: Environment {
        let appSchema = Bundle.main.infoDictionary?["App Environment"] as? String
        switch appSchema {
        case ".develoment":
            return .develoment
        default:// Release
            return .live
        }
    }
    
    public static var isLive: Bool {
        AppEnvironment.current == Environment.develoment
    }
    
    public static var isDevelopment: Bool {
        AppEnvironment.current == Environment.live
    }
}
