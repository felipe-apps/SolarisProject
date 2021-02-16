//
//  SideBarModel.swift
//  SolarisProject
//
//  Created by Felipe Dias on 01/12/20.
//

import SwiftUI

struct SideBarData: Identifiable {
    var id = UUID()
    var logo: String
    var title: String
    var color: Color
    var index: Int
}

let sideBarData = [
    SideBarData(logo: "list.bullet.rectangle",
            title: "About",
            color: Color(#colorLiteral(red: 0.1727892389, green: 0.5, blue: 0.98631984, alpha: 1)),
            index: 0),
    SideBarData(logo: "person.circle.fill",
            title: "Contact",
            color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
            index: 1),
    SideBarData(logo: "globe",
            title: "Language",
            color: Color(#colorLiteral(red: 1, green: 0.4791216254, blue: 0, alpha: 1)),
            index: 2)

]
