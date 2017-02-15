//
//  ImageObject.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 2/15/17.
//  Copyright © 2017 Evandro Harrison Hoffmann. All rights reserved.
//

import Foundation
import AwesomeData

class ImageObject: NSObject {

    var thumbnail: String?
    var lowResolution: String?
    var standardResolution: String?
    
    // MARK: - Class functions
    
    static func fetchImages(completed: ((_ images: [ImageObject])->Void)?){
        _ = AwesomeRequester.performRequest("https://www.instagram.com/itsdayoff_travelblog/media/") { (data) in
            if let jsonObject = AwesomeParser.jsonObject(data) {
                var images = [ImageObject]()
                
                if let items = jsonObject["items"] as? [[String: Any]] {
                    for item in items {
                        if let image = item["images"] as? [String: Any] {
                            let imageObject = ImageObject()
                            imageObject.thumbnail = AwesomeParser.stringValue(image, key: "thumbnail")
                            imageObject.lowResolution = AwesomeParser.stringValue(image, key: "low_resolution")
                            imageObject.standardResolution = AwesomeParser.stringValue(image, key: "standard_resolution")
                            images.append(imageObject)
                        }
                    }
                    completed?(images)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
}
