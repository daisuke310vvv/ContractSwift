//
//  ContractSwiftCore.swift
//  ContractSwiftPackageDescription
//
//  Created by Daisuke Sato on 2018/03/13.
//

import Foundation
import CryptoSwift

//Contract.Function.transfer(_to: "0x...", _value: BInt("1000000000000000000")).txDataString()

public struct ContractSwiftCore {
    static public func run(config: Config) throws {
        print("-> \(config.outputURL.absoluteString)")
        print("input file url -> \(config.inputFileURL.absoluteString)")

        do {
            let inputFileData = try Data(contentsOf: config.inputFileURL)
            guard let json = try JSONSerialization.jsonObject(with: inputFileData, options: []) as? [[String: Any]] else {
                print("could not decode to json.")
                return
            }
            let contract = Contract(json: json)
            let contractPrinter = ContractPrinter(name: "Contract", contract: contract)
            
            let printables: [Printable] = [FileHeaderPrinter(), ImportPrinter(), contractPrinter]
            
            let fileContents = printables
                .flatMap { $0.print() }
                .joined(separator: "\n\n")
                + "\n"
            do {
                try fileContents.write(to: config.outputURL, atomically: true, encoding: .utf8)
            } catch {
                print(error)
            }

        } catch {
            print(error.localizedDescription)
        }

    }
}
