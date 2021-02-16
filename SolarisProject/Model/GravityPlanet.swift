//
//  GravityPlanet.swift
//  SolarisProject
//
//  Created by Felipe Dias on 10/01/21.
//

import SwiftUI

struct GravityPlanet {
    var id = UUID()
    var name: String
    var color: Color
    var height: Double
    var time: Double
}

let gravityPlanet = [
    GravityPlanet(name: "Sun", color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), height: 1, time: 0.01),
    GravityPlanet(name: "Mercury", color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), height: 53, time: 0.53),
    GravityPlanet(name: "Venus", color: Color(#colorLiteral(red: 0.6666666667, green: 0.3137254902, blue: 0, alpha: 1)), height: 22, time: 0.22),
    GravityPlanet(name: "Earth", color: Color(#colorLiteral(red: 0, green: 0.2196078431, blue: 1, alpha: 1)), height: 20, time: 0.2),
    GravityPlanet(name: "Moon", color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), height: 125, time: 1.25),
    GravityPlanet(name: "Mars", color: Color(#colorLiteral(red: 0.7843137255, green: 0.3529411765, blue: 0.3141462366, alpha: 1)), height: 53, time: 0.53),
    GravityPlanet(name: "Jupiter", color: Color(#colorLiteral(red: 1, green: 0.9647058824, blue: 0.6431372549, alpha: 1)), height: 8.5, time: 0.085),
    GravityPlanet(name: "Saturn", color: Color(#colorLiteral(red: 0.9607843137, green: 0.8431372549, blue: 0.2196078431, alpha: 1)), height: 22, time: 0.22),
    GravityPlanet(name: "Uranus", color: Color(#colorLiteral(red: 0.4784313725, green: 0.7882352941, blue: 0.7137254902, alpha: 1)), height: 23, time: 0.23),
    GravityPlanet(name: "Neptune", color: Color(#colorLiteral(red: 0.4274509804, green: 0.2274509804, blue: 1, alpha: 1)), height: 18, time: 0.18)
]
