//
//  main.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation
import ContractSwiftCore
import Commander

struct CommanderArguments {
    static let outputDir = Argument<String>("outputDir", description: "Output directory for the 'Contract.swift' file.")
    static let inputFile = Argument<String>("inputFile", description: "Input file path(abi.json)")
}

let generate = command (CommanderArguments.outputDir, CommanderArguments.inputFile) { (outputDir, inputFile) in
    let outputURL = URL(fileURLWithPath: outputDir).appendingPathComponent(ContractSwift.resourceFileName, isDirectory: false)
    let inputFileURL = URL(fileURLWithPath: inputFile)
    let config = Config(outputURL: outputURL, inputFileURL: inputFileURL)
    try ContractSwiftCore.run(config: config)
}

// Debug
//try generate.run(["/Users/dsk/org/daisuke310vvv/ContractSwift", "/Users/dsk/org/daisuke310vvv/ContractSwift/abi.json"])

let group = Group()
group.addCommand("generate", "Generates Contract.generated.swift", generate)
group.run(ContractSwift.version)

