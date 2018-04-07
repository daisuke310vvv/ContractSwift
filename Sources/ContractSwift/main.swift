//
//  main.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation
import ContractSwiftCore
import Commander
import PathKit

func inputFilePaths(from pattern: String) -> [String] {
    return Path.glob(pattern).map { $0.absolute().string }
}

struct CommanderArguments {
    static let inputDir = Argument<String>("inputDir", description: "Input file path(abi.json)")
    static let outputDir = Argument<String>("outputDir", description: "Output directory for the 'ContractSwift' file.")
}

let generate = command (CommanderArguments.inputDir, CommanderArguments.outputDir) { (inputDir, outputDir) in
    let inputURLs = inputFilePaths(from: inputDir + "/*.json").map { URL(string: $0)! }
    let outputURL = URL(fileURLWithPath: outputDir).appendingPathComponent(ContractSwift.resourceFileName, isDirectory: false)
    let config = Config(inputURLs: inputURLs, outputURL: outputURL)
    try ContractSwiftCore.run(config: config)
}

// Debug
//try generate.run(["/Users/dsk/org/daisuke310vvv/ContractSwift/abi", "/Users/dsk/org/daisuke310vvv/ContractSwift"])

let group = Group()
group.addCommand("generate", "Generates Contract.generated.swift", generate)
group.run(ContractSwift.version)

