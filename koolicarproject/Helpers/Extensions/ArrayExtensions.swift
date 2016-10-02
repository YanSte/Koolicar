//
//  ArrayExtensions.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import Foundation

extension Array {
    
    public func get(_ index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
}
