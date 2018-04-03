//
//  Contract.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/04/02.
//

import Foundation

struct Contract: Printable {
    var functions: [Function]
    
    init(json: [[String: Any]]) {
        functions = json
            .filter { ($0["type"] as! String) == "function" }
            .compactMap { Function($0) }
    }
    
    func print() -> String {
        let cases = functions.map { $0.print(printType: .onlyType) }
        let swiftFunctions = [
            SignatureFunctionPrinter(functions: functions),
            TxDataStringFunctionPrinter(functions: functions),
            Sha3FunctionPrinter(),
        ] as? [SwiftEnumFunctionPriter]
        let enumPrinter = SwiftEnumPrinter(name: "Function", cases: cases, functionPrinters: swiftFunctions)
        
        return enumPrinter.print()
    }
}
