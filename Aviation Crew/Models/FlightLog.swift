//
//  FlightLog.swift
//  Aviation Crew
//
//  Created by Marcos Garcia on 03/03/26.
//
import Foundation


struct FlightLog: Identifiable, Codable {
    
    var id = UUID()
    var flightNumber: String
    var pilot: String
    var origin: String
    var destination: String
    var date: Date
    
    var routeString: String {
        return "\(origin) -> \(destination)"
    }
}
