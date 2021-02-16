//
//  MenuModel.swift
//  SolarisProject
//
//  Created by Felipe Dias on 01/12/20.
//

import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var image: Image
    var colorTop: Color
    var colorBot: Color
    var index: Int
}

let menuData = [
    Section(title: "Solar System\nExploration",
            image: Image(uiImage: #imageLiteral(resourceName: "solarSystem")),
            colorTop: Color(#colorLiteral(red: 0.1058823529, green: 0.3960784314, blue: 0.9411764706, alpha: 1)),
            colorBot: Color(#colorLiteral(red: 0.1137254902, green: 0.831372549, blue: 0.9921568627, alpha: 1)),
            index: 0),
    Section(title: "Planet\nCompare",
            image: Image(uiImage: #imageLiteral(resourceName: "planetCompare")),
            colorTop: Color(#colorLiteral(red: 1, green: 0.1607843137, blue: 0.4117647059, alpha: 1)),
            colorBot: Color(#colorLiteral(red: 1, green: 0.3647058824, blue: 0.2274509804, alpha: 1)),
            index: 1),
    Section(title: "Play with\nGravity",
            image: Image(uiImage: #imageLiteral(resourceName: "weightPlanet")),
            colorTop: Color(#colorLiteral(red: 0.2926589828, green: 0.02556207353, blue: 0.7140764949, alpha: 1)),
            colorBot: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
            index: 2)
]
