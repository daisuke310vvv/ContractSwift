//
//  SMP+Extension.swift
//  ContractSwift
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

extension BInt: Hex256bitStringer {
    var hex256bitString: String {
        get {
            return self.asString(withBase: 16).zeroPadding(length: 64)
        }
    }
}
