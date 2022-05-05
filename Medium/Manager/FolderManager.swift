//
//  FolderManager.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

class FolderManager {
    private let fileManager = FileManager.default
    
    func fileExists(at url: URL) -> Bool {
        fileManager.fileExists(atPath: url.path)
    }
    
    /// Removes the file or directory at the specified URL.
    func removeItem(at url: URL) throws {
        try fileManager.removeItem(at: url)
    }
    
    /// Creates a directory  at the specified URL.
    ///
    /// - Parameter url: A file URL that specifies the directory to create.
    func createFolder(at url: URL) throws {
        guard !fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            // Create a directory.
            try fileManager.createDirectory(at: url)
        } catch {
            if let error = error as? FolderError {
                throw error
            } else {
                throw FolderError.unableToCreateDirectory
            }
        }
    }
}

extension FolderManager {
    enum FolderError: Error {
        case duplicatedFilename
        case unableToCreateDirectory
        case unableToDeleteDirectory
        
        var title: String {
            switch self {
            case .duplicatedFilename:
                return ""
            case .unableToCreateDirectory:
                return ""
            case .unableToDeleteDirectory:
                return ""
            }
        }
        
        var message: String? {
            switch self {
            case .duplicatedFilename:
                return ""
            case .unableToCreateDirectory:
                return ""
            case .unableToDeleteDirectory:
                return ""
            }
        }
    }
}
