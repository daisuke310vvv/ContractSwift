//
//  main.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation
import ContractSwiftCore

let tool = ContractSwift()

do {
    try tool.run()
} catch {
    print("error occurred \(error)")
}
