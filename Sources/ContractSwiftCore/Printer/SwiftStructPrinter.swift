//
//  StructPrinter.swift
//  ContractSwift
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

struct ContractPrinter: Printable {
    let name: String
    let contract: Contract
    let functionPrinters: [SwiftFunctionPrinter]

    init(name: String, contract: Contract, functionPrinters: [SwiftFunctionPrinter] = []) {
        self.name = name
        self.functionPrinters = functionPrinters
        self.contract = contract
    }

    func print() -> String {
        return [
            "struct \(name) {",
            contract.print(),
            functionPrinters.map { $0.print() }.joined(separator: "\n"),
            "}"
        ].joined(separator: "\n")
    }
}
