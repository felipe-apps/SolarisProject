//
//  HeightMeter.swift
//  SolarisProject
//
//  Created by Felipe Dias on 11/01/21.
//

import SwiftUI

struct HeightMeter: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meters")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
            HStack {
                VStack(alignment: .trailing, spacing: 27) {
                    Text("2.00")
                    Text("1.50")
                    Text("1.00")
                    Text("0.50")
                    Text("0")
                }
                .font(.system(size: 20, weight: .medium, design: .rounded))
                
                VStack(alignment: .trailing, spacing: 8) {
                    
                    ForEach(0..<4) { item in
                        Rectangle()
                            .frame(width: 30, height: 4)
                        ForEach(0..<4) { item in
                            Rectangle()
                                .frame(width: 20, height: 2)
                        }
                    }
                    Rectangle()
                        .frame(width: 30, height: 4)
                    
                }
            }
        }
        .foregroundColor(.white)
        
    }
}

struct HeightMeter_Previews: PreviewProvider {
    static var previews: some View {
        HeightMeter()
    }
}
