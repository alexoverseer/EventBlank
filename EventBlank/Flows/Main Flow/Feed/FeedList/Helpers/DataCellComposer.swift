//
//  DataCellComposer.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import UIKit

class DataCellComposer: NSObject {
    /// Cache used to store processed images, keyed on `DataItem` identifiers.
    static private var processedImageCache = NSCache<NSString, UIImage>()
    
    /**
     A dictionary of `NSOperationQueue`s for `DataItemCollectionViewCell`s. The
     queues contain operations that process images for `DataItem`s before updating
     the cell's `UIImageView`.
     */
    private var operationQueues = [FeedTableViewCell: OperationQueue]()
    
    // MARK: Implementation
    
    func compose(_ cell: FeedTableViewCell, withDataItem dataItem: ConferenceViewVModel) {
        // Cancel any queued operations to process images for the cell.
        let queue = operationQueue(forCell: cell)
        queue.cancelAllOperations()
        
        // Set the cell's properties.
        cell.titleLabel.text = dataItem.conference.title
        cell.descLabel.text = dataItem.conference.description
        
        guard let resource = dataItem.resouces.first else { return }
        cell.representedDataItem = resource
        
        guard let imageName = resource.local else { return }
        
        cell.thumbnail.image = DataCellComposer.processedImageCache.object(forKey: NSString(string: imageName))
        
        // No further work is necessary if the cell's image view has an image.
        guard cell.thumbnail.image == nil else { return }
        
        /*
         Initial rendering of a jpeg image can be expensive. To avoid stalling
         the main thread, we create an operation to process the `DataItem`'s
         image before updating the cell's image view.
         
         The execution block is added after the operation is created to allow
         the block to check if the operation has been cancelled.
         */
        let processImageOperation = BlockOperation()
        
        processImageOperation.addExecutionBlock { [unowned processImageOperation] in
            // Ensure the operation has not been cancelled.
            guard !processImageOperation.isCancelled else { return }
            
            // Load and process the image.
            guard let image = self.processImage(named: imageName) else { return }
            
            // Store the processed image in the cache.
            guard let resourceImageName = resource.local else { return }
            
            DataCellComposer.processedImageCache.setObject(image, forKey: NSString(string: resourceImageName))
            
            OperationQueue.main.addOperation {
                // Check that the cell is still showing the same `DataItem`.
                guard resource == cell.representedDataItem! else { return }
                
                // Update the cell's `UIImageView` and then fade it into view.
                cell.thumbnail.alpha = 0.0
                cell.thumbnail.image = image
                
                UIView.animate(withDuration: 0.25) {
                    cell.thumbnail.alpha = 1.0
                }
            }
        }
        
        queue.addOperation(processImageOperation)
    }
    
    // MARK: Convenience
    
    /**
     Returns the `NSOperationQueue` for a given cell. Creates and stores a new
     queue if one doesn't already exist.
     */
    private func operationQueue(forCell cell: FeedTableViewCell) -> OperationQueue {
        if let queue = operationQueues[cell] {
            return queue
        }
        
        let queue = OperationQueue()
        operationQueues[cell] = queue
        
        return queue
    }
    
    /**
     Loads a UIImage for a given name and returns a version that has been drawn
     into a `CGBitmapContext`.
     */
    private func processImage(named imageName: String) -> UIImage? {
        // Load the image.
        guard let image = UIImage(named: imageName) else { return nil }
        
        // Create a `CGColorSpace` and `CGBitmapInfo` value that is appropriate fqor the device.
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue
        
        // Create a bitmap context of the same size as the image.
        let imageWidth = Int(Float(image.size.width))
        let imageHeight = Int(Float(image.size.height))
        
        let bitmapContext = CGContext(data: nil,
                                      width: imageWidth,
                                      height: imageHeight,
                                      bitsPerComponent: 8,
                                      bytesPerRow: imageWidth * 4,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo)
        
        // Draw the image into the graphics context.
        guard let imageRef = image.cgImage else { fatalError("Unable to get a CGImage from a UIImage.") }
        bitmapContext?.draw(imageRef, in: CGRect(origin: CGPoint.zero, size: image.size))
        
        // Create a new `CGImage` from the contents of the graphics context.
        guard let newImageRef = bitmapContext?.makeImage() else { return image }
        
        // Return a new `UIImage` created from the `CGImage`.
        return UIImage(cgImage: newImageRef)
    }
}
