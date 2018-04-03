//
//  EnumPrinter.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

struct SwiftEnumPrinter {
    let name: String
    let cases: [String]
    let functionPrinters: [SwiftEnumFunctionPriter]

    init(name: String, cases: [String], functionPrinters: [SwiftEnumFunctionPriter]?) {
        self.name = name
        self.cases = cases
        self.functionPrinters = functionPrinters ?? []
    }
    
    func print() -> String {
        return [
            "enum \(name) {",
            cases.map { "case \($0)" }.joined(separator: "\n"),
            functionPrinters.map { $0.print() }.joined(separator: "\n"),
            "}"
        ].joined(separator: "\n")
    }
}
