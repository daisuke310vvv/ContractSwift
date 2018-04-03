//
//  Function.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/04/02.
//

import Foundation

struct Function {
    let name: String
    let type: String
    let inputs: [Input]
    
    enum PrintType {
        case signature
        case ignoreVals
        case onlyType
        case withLet
    }

    init(_ dict: [String: Any]) {
        self.name = dict["name"] as? String ?? ""
        self.type = dict["type"] as? String ?? "function"
        self.inputs = (dict["inputs"] as! [[String: Any]]).map { Input($0) }
    }
    
    func print(printType: PrintType) -> String {
        switch printType {
        case .signature:
            return name + "(" + inputs.map { $0.type.rawValue }.joined(separator: ",") + ")"
        case .ignoreVals:
            guard inputs.count > 0 else { return name }
            return name + "(" + inputs.map { _ in "_" }.joined(separator: ",") + ")"
        case .onlyType:
            guard inputs.count > 0 else { return name }
            return name + "(" + inputs.map { "\($0.type.toSwiftTypeString())" }.joined(separator: ", ") + ")"
        case .withLet:
            guard inputs.count > 0 else { return name }
            return name + "(" + inputs.map { "let \($0.name)" }.joined(separator: ", ") + ")"
        }
    }
}

struct Input {
    let name: String
    let type: Type

    init(_ dict: [String: Any]) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            self.name = ""
        }

        if let type = dict["type"] as? String, let sType = Type(rawValue: type) {
            self.type = sType
        } else {
            self.type = .address
        }
    }
}
