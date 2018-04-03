//
//  Address.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

public struct Address {
    public let string: String

    public init(string: String) {
        self.string = string
    }
}

extension Address: Hex256bitStringer {
    public var hex256bitString: String {
        get {
            var hex: String = string
            if string.count > 2 && string.prefix(2) == "0x" {
                hex = String(string.suffix(string.count - 2))
            }
            return hex.zeroPadding(length: 64)
        }
    }
}
