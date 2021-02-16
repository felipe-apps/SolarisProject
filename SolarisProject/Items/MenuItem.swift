//
//  MenuItem.swift
//  SolarisProject
//
//  Created by Felipe Dias on 01/12/20.
//

import SwiftUI

struct MenuItem: View {
    var section: Section = menuData[0]
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(section.title)
                .font(.system(size: 25, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 10)
            Spacer()
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(LinearGradient(gradient: Gradient(colors: [section.colorTop, section.colorBot]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .shadow(color: section.colorBot.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem()
    }
}
