//
//  Vehicle.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Vehicle: Mappable {
    
    private(set) var id:            Int!
    private(set) var addressId:     Int!
    private(set) var year:          Int!
    private(set) var doorsCount:    Int!
    private(set) var placesCount:   Int!
    private(set) var fuelTypeCd:    Int!
    private(set) var gearsTypeCd:   Int!
    private(set) var vehicle_model: String!
    private(set) var brand:         String!
    private(set) var category:      String!
    private(set) var thumbnailUrl:  String!
    private(set) var distance:      String?
    private(set) var latitude:      Double!
    private(set) var longitude:     Double!
    
    public init?(map: Map) {
        guard
            map.JSON["id"]              != nil,
            map.JSON["address_id"]      != nil,
            map.JSON["year"]            != nil,
            map.JSON["doors_count"]     != nil,
            map.JSON["places_count"]    != nil,
            map.JSON["fuel_type_cd"]    != nil,
            map.JSON["gears_type_cd"]   != nil,
            map.JSON["places_count"]    != nil,
            map.JSON["vehicle_model"]   != nil,
            map.JSON["brand"]           != nil,
            map.JSON["category"]        != nil,
            map.JSON["thumbnail_url"]   != nil,
            map.JSON["fake_latitude"]   != nil,
            map.JSON["fake_longitude"]  != nil
            else {
                return nil
        }
        mapping(map: map)
    }
    
    // Mappable
    public mutating func mapping(map: Map) {
        id              <- map["id"]
        addressId       <- map["address_id"]
        year            <- map["year"]
        doorsCount      <- map["doors_count"]
        placesCount     <- map["places_count"]
        fuelTypeCd      <- map["fuel_type_cd"]
        gearsTypeCd     <- map["gears_type_cd"]
        vehicle_model   <- map["vehicle_model"]
        brand           <- map["brand"]
        category        <- map["category"]
        thumbnailUrl    <- map["thumbnail_url"]
        distance        <- map["distance_string"]
        latitude        <- map["fake_latitude"]
        longitude       <- map["fake_longitude"]
    }
}
