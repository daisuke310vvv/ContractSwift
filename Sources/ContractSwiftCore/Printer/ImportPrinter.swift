//
//  Import.swift
//  ContractSwift
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

struct ImportPrinter: Printable {
    func print() -> String {
        return [
            "import Foundation",
            "import CryptoSwift",
            ].joined(separator: "\n")
    }
}
