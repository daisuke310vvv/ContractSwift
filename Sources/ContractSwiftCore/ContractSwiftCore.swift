//
//  ContractSwiftCore.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation

public struct ContractSwiftCore {
    static public func run(config: Config) throws {
        print("input file urls -> \(config.inputURLs.map { $0.absoluteString })")
        print("output file url -> \(config.outputURL.absoluteString)")
        
        do {
            let contracts = try config.inputURLs.map { try ContractParser.parse(from: $0.absoluteString) }
            let contractPrinters = contracts.map { ContractPrinter(contract: $0) }
            let externalContractPrinter = ExternalContractPrinter(contractPrinters: contractPrinters)
            
            let printers: [Printable] = [FileHeaderPrinter(), ImportPrinter(), externalContractPrinter]
            let fileContents = printers.compactMap { $0.print() }.joined(separator: "\n\n") + "\n"
            do {
                try fileContents.write(to: config.outputURL, atomically: true, encoding: .utf8)
                print("Created! -> \(config.outputURL.absoluteString)")
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
}
