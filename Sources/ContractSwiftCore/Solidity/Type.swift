//
//  Types.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/03/14.
//

import Foundation

enum Type: String {
    case bool       = "bool"
    case int8       = "int8"
    case int16      = "int16"
    case int32      = "int32"
    case int64      = "int64"
    case int128     = "int128"
    case int256     = "int256"
    case uint8      = "uint8"
    case uint16     = "uint16"
    case uint32     = "uint32"
    case uint64     = "uint64"
    case uint128    = "uint128"
    case uint256    = "uint256"
    case address    = "address"
    case string     = "string"
    case bytes      = "bytes"
    case bytes1     = "bytes1"
    case bytes2     = "bytes2"
    case bytes4     = "bytes4"
    case bytes8     = "bytes8"
    case bytes16    = "bytes16"
    case bytes32    = "bytes32"
    
    func toSwiftTypeString() -> String {
        switch self {
        case .bool:
            return "Bool"
        case .int8, .int16, .int32, .int64, .int128, .int256:
            return "BInt"
        case .uint8, .uint16, .uint32, .uint64, .uint128, .uint256:
            return "BInt"
        case .address:
            return "Address"
        case .string:
            return "String"
        case .bytes, .bytes1, .bytes2, .bytes4, .bytes8, .bytes16, .bytes32:
            return "Data"
        }
    }
    
}
