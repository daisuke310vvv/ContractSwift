//
//  ContractParser.swift
//  Commander
//
//  Created by Daisuke Sato on 2018/04/07.
//

import Foundation
import PathKit

struct ContractParser {
    static func parse(from path: String) throws -> Contract {
        guard let name = path.split(separator: "/").last?.replacingOccurrences(of: ".json", with: ""), name.count > 0 else {
            throw ParserError.parseNameError
        }
        let jsonData = try Path(path).read()
        guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
            throw ParserError.invalidJsonFile
        }
        return Contract(name: String(name), json: json)
    }
}
