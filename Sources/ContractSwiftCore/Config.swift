//
//  Config.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation

public struct Config {
    let outputURL: URL
    let inputFileURL: URL
    
    public init(
        outputURL: URL,
        inputFileURL: URL
        ) {
        self.outputURL = outputURL
        self.inputFileURL = inputFileURL
    }
}
