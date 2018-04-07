//
//  StructPrinter.swift
//  ContractSwift
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

struct ExternalContractPrinter: Printable {
    let contractPrinters: [ContractPrinter]
    
    init(contractPrinters: [ContractPrinter]) {
        self.contractPrinters = contractPrinters
    }
    
    func print() -> String {
        return [
            "struct Contract {",
            contractPrinters.map { $0.print() }.joined(separator: "\n"),
            "}"
        ].joined(separator: "\n")
    }
}

struct ContractPrinter: Printable {
    let name: String
    let contract: Contract
    let functionPrinters: [SwiftFunctionPrinter]

    init(contract: Contract, functionPrinters: [SwiftFunctionPrinter] = []) {
        self.name = contract.name
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
