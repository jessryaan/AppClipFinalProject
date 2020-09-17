//
//  checkPoints.swift
//  demo-app-clip
//
//  Created by Jess Ryan on 7/29/20.
//
import SwiftUI
import MapKit

var points = [
    CheckPoint(id:"bec1" ,name: "Boulder Experience Center", description: "ready, set, go!", time: nil ,coordinates: CLLocationCoordinate2D(latitude: 40.0372, longitude: -105.2225), visited: false, revealed: true, nextId: "chap"),
    CheckPoint(id: "chap", name: "Chapman Summit", description: "where dirt meets pavement...", time: nil , coordinates: CLLocationCoordinate2D(latitude: 39.9971, longitude: -105.3090), visited: false, revealed: false, nextId: "james"),
    CheckPoint(id: "james", name: "Jamestown Mercantile", description: "refuel!", time: nil, coordinates: CLLocationCoordinate2D(latitude: 40.1157, longitude: -105.3877), visited: false, revealed: false, nextId: "brain"),
    CheckPoint(id: "brain", name: "Brainard Lake", description: "quick dip", time: nil, coordinates: CLLocationCoordinate2D(latitude: 40.0772, longitude: -105.5711), visited: false, revealed: false, nextId: "bec2"),
    CheckPoint(id: "bec2", name: "Boulder Experience Center", description: "Heading home!", time: nil, coordinates: CLLocationCoordinate2D(latitude: 40.0372, longitude: -105.2225), visited: false, revealed: false, nextId: "bec1")
]
