//
//  Types.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/03/14.
//

import Foundation

enum Type: String {
    case address = "address"
    case uint256 = "uint256"
    
    func toSwiftTypeString() -> String {
        switch self {
        case .address: return "Address"
        case .uint256: return "BInt"
        }
    }
}
