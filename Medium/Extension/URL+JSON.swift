//
//  URL+JSON.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

extension URL {
    func appendingJSONComponent(_ name: String) -> URL {
        self
            .appendingPathComponent(name)
            .appendingPathExtension("json")
    }
}

public extension JSONEncoder {
    static func save<T>(_ value: T, in url: URL) throws where T: Encodable {
        try JSONEncoder().encode(value).write(to: url, options: .atomicWrite)
    }
}

public extension JSONDecoder {
    static func decode<T>(_ value: T.Type, from url: URL) throws -> T where T: Decodable {
        try JSONDecoder().decode(value, from: Data(contentsOf: url))
    }
}
