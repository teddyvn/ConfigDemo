//
//  Configuration.swift
//  ConfigDemo
//
//  Created by admin on 23/07/2021.
//

import Foundation
class ConfigLoader {
    static let ConfigName = "Config.plist"
    
    static func parseFile(named fileName: String = ConfigName) -> Configuration {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
              let fileData = FileManager.default.contents(atPath: filePath)
        else {
            fatalError("[ConfigDemo] Config file '\(fileName)' not loadable!")
        }
        
        do {
            let config = try PropertyListDecoder().decode(Configuration.self, from: fileData)
            return config
        } catch {
            fatalError("[ConfigDemo] Configuration not decodable from '\(fileName)': \(error)")
        }
    }
}

struct Configuration: Decodable {
    let key1: String
    let key2: String
}
