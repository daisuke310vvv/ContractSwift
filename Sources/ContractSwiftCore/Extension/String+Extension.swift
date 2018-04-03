//
//  String.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation

extension String {
    func zeroPadding(length: Int) -> String {
        let left = length - self.count
        guard left > 0 else { return self }
        
        var s = ""
        for _ in 0..<left {
            s += "0"
        }
        return s + self
    }
}
