//
//  ImageFactory.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

final class ImageFactory {
    private let directory: ImageFactoryDirectory
    private let folderManager = FolderManager()
        
    init(directory: ImageFactoryDirectory) {
        self.directory = directory
        try? folderManager.createFolder(at: directory.folderURL)
    }
    
    /// Returns image of specified name.
    func image(named name: String) -> UIImage? {
        let cacheKey = NSString(string: name)
        
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            return cachedImage
        } else if let image = UIImage(contentsOfFile: directory.makeURLForImage(named: name).path) {
            imageCache.setObject(image, forKey: cacheKey)
            return image
        } else {
            return nil
        }
    }
    
    static func generateImageName() -> String {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let year = String(components.year ?? 0)
        let month = String.init(format: "%.2d", (components.month ?? 0))
        let day = String.init(format: "%.2d", (components.day ?? 0))
        let hour = String.init(format: "%.2d", (components.hour ?? 0))
        let minute = String.init(format: "%.2d", (components.minute ?? 0))
        let seconds = String.init(format: "%.2d", (components.second ?? 0))
        let id = String("\(year)\(month)\(day)\(hour)\(minute)\(seconds)".reversed())
        
        return "IMG_\(id)"
    }
    
    /// Generates random image name.
    /// - Returns: Returns generated image name.
    func generateImageName() -> String {
        ImageFactory.generateImageName()
    }
    
    /// Saves image with specified name.
    func save(image: UIImage, withName name: String) throws {
        guard let data = image.pngData() else { return }
        
        do {
            let imageURL = directory.makeURLForImage(named: name)
            try data.write(to: imageURL)
            imageCache.setObject(image, forKey: NSString(string: name))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// Deletes image from products directory.
    func delete(imageNamed name: String) {
        let imageURL = directory.makeURLForImage(named: name)
        
        do {
            try folderManager.removeItem(at: imageURL)
            imageCache.removeObject(forKey: NSString(string: name))
        } catch {
            print("Could not delete image at \(imageURL)")
        }
    }
}
