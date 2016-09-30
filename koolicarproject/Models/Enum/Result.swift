//
//  Result.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import Foundation

public enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
