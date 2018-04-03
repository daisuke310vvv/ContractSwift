//
//  FunctionPrinter.swift
//  ContractSwift
//
//  Created by Daisuke Sato on 2018/04/03.
//

import Foundation

protocol SwiftFunctionPrinter {
    var name: String { get }
    
    func print() -> String
}

protocol SwiftEnumFunctionPriter {
    var name: String { get }
    
    func print() -> String
}

struct SignatureFunctionPrinter: SwiftEnumFunctionPriter {
    var name: String { get { return "signature() -> String" } }
    let functions: [Function]
    
    init(functions: [Function]?) {
        self.functions = functions ?? []
    }

    func print() -> String {
        return [
            "func \(name) {",
            "switch self {",
            functions.map { fn in
                let caseStr = "case ." + fn.print(printType: .ignoreVals) + ":"
                let returnStr = "return " + "\"" + fn.print(printType: .signature) + "\""
                return caseStr + "\n" + returnStr
                }.joined(separator: "\n"),
            "}",
            "}"
            ].joined(separator: "\n")
    }
}

struct TxDataStringFunctionPrinter: SwiftEnumFunctionPriter {
    var name: String { get { return "txDataString() -> String" } }
    let functions: [Function]
    
    init(functions: [Function]?) {
        self.functions = functions ?? []
    }
    
    func print() -> String {
        return [
            "func \(name) {",
            "switch self {",
            functions.map { fn in
                let caseStr = "case ." + fn.print(printType: .withLet) + ":"
                let returnStr = "return " + "\"0x\"" + " + " + "sha3(str: signature()).toHexString().prefix(8)" + (fn.inputs.count > 0 ? " + " + fn.inputs.map { "\($0.name).hex256bitString" }.joined(separator: " + ") : "")
                return caseStr + "\n" + returnStr
                }.joined(separator: "\n"),
            "}",
            "}"
            ].joined(separator: "\n")
    }
}

struct Sha3FunctionPrinter: SwiftEnumFunctionPriter {
    var name: String { get { return "sha3(str: String) -> Data" } }
    
    func print() -> String {
        return [
            "func \(name) {",
            "let data = Data(bytes: str.bytes)",
            "return data.sha3(.keccak256)",
            "}"
            ].joined(separator: "\n")
    }
}

