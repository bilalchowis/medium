//
//  ImageFactoryDirectory.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

enum ImageFactoryDirectory: String {
    case post = "._post"
    
    var parentFolderName: String {
        return "Images"
    }
    
    var path: String {
        "\(parentFolderName)/\(self.rawValue)"
    }
    
    var folderURL: URL {
        let docURL = FileManager.documentURL
        let parentURL = docURL.appendingPathComponent(parentFolderName)
        let folderURL = parentURL.appendingPathComponent(self.rawValue)

        return folderURL
    }
    
    func makeURLForImage(named name: String) -> URL {
        folderURL.appendingPathComponent(name).appendingPathExtension("png")
    }
}
