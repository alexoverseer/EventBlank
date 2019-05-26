//
//  EventRegionBuilder.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 5/26/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation
import MapKit

struct EventRegionBuilder {
    
    static func buildEventLocation() -> (region: MKCoordinateRegion, annotation: MKPointAnnotation) {
        let coordinate = CLLocationCoordinate2D(latitude: 42.471_562,
                                                longitude: -2.430_187)
        let span = MKCoordinateSpan(latitudeDelta: 0.01,
                                    longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = region.center
        
        return (region, annotation)
    }
    
    static func buildMapItem() -> (mapItem: MKMapItem, options: [String: NSValue]) {
        let region: MKCoordinateRegion = EventRegionBuilder.buildEventLocation().region
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: region.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: region.span)
        ]
        let placemark = MKPlacemark(coordinate: region.center, addressDictionary: nil)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Riojaforum, Congress and Auditorium of La Rioja"
        
        return (mapItem, options)
    }
}
