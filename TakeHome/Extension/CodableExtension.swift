//
//  CodableExtension.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any]? {
        let data = try? JSONEncoder().encode(self)
        if (data == nil) {
            return nil
        }
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {
            return nil
        }
        
        return dictionary
    }
}
