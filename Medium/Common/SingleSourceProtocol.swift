//
//  SingleSourceProtocol.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

protocol SingleSourceProtocol {
    /// The directory url.
    var folderURL: URL { get }
    /// The file url.
    var fileURL: URL { get }
}
