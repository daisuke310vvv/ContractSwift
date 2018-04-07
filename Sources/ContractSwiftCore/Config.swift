//
//  Config.swift
//  ContractSwiftTests
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation

public struct Config {
    let inputURLs: [URL]
    let outputURL: URL

    public init(
        inputURLs: [URL],
        outputURL: URL
        ) {
        self.inputURLs = inputURLs
        self.outputURL = outputURL
    }
}
