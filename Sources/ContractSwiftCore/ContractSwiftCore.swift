//
//  ContractSwiftCore.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation

public final class ContractSwift {
    private let arguments: [String]
    
    public init(arguments: [String] = [""]) {
        self.arguments = arguments
    }
    
    public func run() throws {
        print("hello")
    }
}
