//
//  Vehicle.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreLocation

// MARK: Equatable

extension VehicleModel: Equatable {}

public func ==(lhs: VehicleModel, rhs: VehicleModel) -> Bool {
    return lhs.id == rhs.id && lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
}

// MARK: Vehicle Model

public struct VehicleModelVehicleModel: Mappable {
    
    private(set) var id:            Int
    private(set) var addressId:     Int
    private(set) var year:          Int
    private(set) var doorsCount:    Int
    private(set) var placesCount:   Int
    // TODO: Mettre en place un enumérateur pour fuelTypeCd et gearsTypeCd
    private(set) var fuelTypeCd:    Int
    private(set) var gearsTypeCd:   Int
    private(set) var vehicle_model: String
    private(set) var brand:         String
    private(set) var category:      String
    private(set) var thumbnailUrl:  String
    private(set) var distance:      String?
    private(set) var latitude:      Double
    private(set) var longitude:     Double
    
    public var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // MARK: Init
    
    public init() {
        self.id = 0
        self.addressId = 0
        self.year = 0
        self.doorsCount = 0
        self.placesCount = 0
        self.fuelTypeCd = 0
        self.gearsTypeCd = 0
        self.vehicle_model = ""
        self.brand = ""
        self.category = ""
        self.thumbnailUrl = ""
        self.latitude = 0
        self.longitude = 0
    }
    
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
        self.init()
        mapping(map: map)
    }
    
    // MARK: Mappable
    
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
