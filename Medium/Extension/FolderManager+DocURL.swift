//
//  FolderManager+DocURL.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

public extension FileManager {
    static var documentURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func createDirectory(at url: URL) throws {
        try createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }
}
