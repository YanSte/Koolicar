//
//  Vehicle.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 "address_id": 70076,
 "id": 10749,
 "year": 2012,
 "doors_count": 5,
 "places_count": 5,
 
 "fuel_type_cd": 0,
 "gears_type_cd": 1,
 "vehicle_model": "Micra",
 "brand": "Nissan",
 "category": "CITADINE",
 "thumbnail_url": "https://koolicar.s3.amazonaws.com/uploads/photo/6103/thumb_2015-11-09_16.13.02.jpg",
 "distance_string": "Paris 11'e8me",
 "fake_latitude": 48.8619248152841,
 "fake_longitude": 2.38026285387939


class Vehicle: Mappable {
    var id: Int
    var addressId: Int
    var year: Int
    var doorsCount: Int
    var placesCount: Int
    var fuelTypeCd: Int
    var gears_type_cd:Int
    

    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
       /* username    <- map["username"]
        age         <- map["age"]
        weight      <- map["weight"]
        array       <- map["arr"]
        dictionary  <- map["dict"]
        bestFriend  <- map["best_friend"]
        friends     <- map["friends"]
        birthday    <- (map["birthday"], DateTransform())*/
    }
} */
