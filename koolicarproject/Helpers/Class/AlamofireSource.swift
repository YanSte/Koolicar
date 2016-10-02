//
//  AlamofireSource.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire

public class AlamofireSource: NSObject, InputSource {
    
    fileprivate var url: NSURL
    
    public init(url: NSURL) {
        self.url = url
        super.init()
    }
    
    public init?(urlString: String) {
        guard let validUrl = NSURL(string: urlString) else {
            return nil
        }
        self.url = validUrl
        super.init()
        
    }
    
    public func set(to imageView: UIImageView) {
        Alamofire.request(url.absoluteString!)
            .responseImage { response in
                guard let image = response.result.value else {
                    return
                }
                imageView.image = image
        }
    }
}
