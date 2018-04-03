//
//  UInt+Extension.swift
//  ContractSwift
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

extension UInt: Hex256bitStringer {
    var hex256bitString: String {
        get {
            let hex = String(self, radix: 16)
            return hex.zeroPadding(length: 64)
        }
    }
}
