//
//  PlanetCompareModel.swift
//  SolarisProject
//
//  Created by Felipe Dias on 19/12/20.
//

import SwiftUI

struct Planets: Identifiable {
    var id = UUID()
    var image: Image
    var name: String
    var index: Int
}
    
let planetList = [
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "mercury")), name: "Mercury", index: 0),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "venus")), name: "Venus", index: 1),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "earth")), name: "Earth", index: 2),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "mars")), name: "Mars", index: 3),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "jupiter")), name: "Jupiter", index: 4),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "saturn")), name: "Saturn", index: 5),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "uranus")), name: "Uranus", index: 6),
    Planets(image: Image(uiImage: #imageLiteral(resourceName: "neptune")), name: "Neptune", index: 7)
]

struct Units: Identifiable {
    var id = UUID()
    var title: String
    var temp: Int
}

let unitsButton = [
    Buttons(title: "Metric", temp: 0),
    Buttons(title: "Astronomical Unit", temp: 1),
    Buttons(title: "English", temp: 2)
]
