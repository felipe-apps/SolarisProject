//
//  SideBar.swift
//  SolarisProject
//
//  Created by Felipe Dias on 30/11/20.
//

import MobileCoreServices
import SwiftUI

struct SideBar: View {
    @State private var copied = false
    
    var body: some View {
            ZStack {
                BlurView(style: .systemThinMaterialDark)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("About")
                                .font(.system(size: 34, weight: .bold))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 23, weight: .medium, design: .rounded))
                            .foregroundColor(.orange)
                        
                        Text("About SolarisApp: ").bold()
                            .font(.system(size: 20))
                    }
                    .padding(.top, 5)
                    
                    Text("    SolarisApp is an app dedicated to those who are passionate about astronomy and want to have quick access to general info of the planets in the Solar System.\n    The SolarisApp iPhone app and services are operated by FDApps in Brazil.")
                        .font(.system(size: 18, weight: .medium))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.system(size: 23, weight: .medium, design: .rounded))
                            .foregroundColor(.purple)
                        
                        Text("Contact us: ").bold()
                            .font(.system(size: 20))
                    }
                    .padding(.top, 15)
                    
                    HStack(spacing: 30) {
                        Link(destination: URL(string: "https://www.instagram.com/lafelipe")!, label: {
                            Image(uiImage: #imageLiteral(resourceName: "instagram-logo"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                        })
                        Link(destination: URL(string: "https://twitter.com/develipe")!, label: {
                            Image(uiImage: #imageLiteral(resourceName: "twitter"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                        })
                        Link(destination: URL(string: "https://www.linkedin.com/in/felipe-d-ferreira-02822b204")!, label: {
                            Image(uiImage: #imageLiteral(resourceName: "linkedin-logo"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                        })
                        Button(action: {
                            
                            UIPasteboard.general.setValue("felipediasapps@gmail.com",
                                        forPasteboardType: kUTTypePlainText as String)
                            copied = true
                            
                            /// delays 2 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                copied = false
                            }
                        }) {
                            copied ?
                                Image(systemName: "checkmark")
                                    .font(.system(size: 23, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .frame(width: 40, height: 40)
                                    .background(Color.green)
                                    .cornerRadius(5)
                            :
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 23, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                                .padding(8)
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .cornerRadius(5)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 23, weight: .medium, design: .rounded))
                            .foregroundColor(.yellow)
                        
                        Text("More info: ").bold()
                            .font(.system(size: 20))
                    }
                    .padding(.top, 15)
                    
                    Group {
                        Link(destination: URL(string: "https://solarisapp.flycricket.io/terms.html")!, label: {
                            HStack {
                                Text("Terms & Conditions")
                                
                                Image(systemName: "chevron.right")
                            }
                            .font(.system(size: 18, weight: .medium))
                        })
                        
                        Link(destination: URL(string: "https://solarisapp.flycricket.io/privacy.html")!, label: {
                            HStack {
                                Text("Privacy Policy")
                                
                                Image(systemName: "chevron.right")
                            }
                            .font(.system(size: 18, weight: .medium))
                        })
                        
                        Link(destination: URL(string: "https://www.apple.com")!, label: {
                            HStack {
                                Text("Rate us")
                                
                                Image(systemName: "chevron.right")
                            }
                            .font(.system(size: 18, weight: .medium))
                        })
                    }
                    
                    Spacer()
                    
                    Text("© 2021 Felipe Dias. All rights reserved.")
                        .font(.system(size: 17, weight: .light, design: .rounded))
                        .padding(.bottom, 25)
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
                
                copied ?
                Text("Email copied\nto clipboard!")
                    .font(.system(size: 23, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(30)
                    .background(BlurView(style: .systemThinMaterialDark))
                    .cornerRadius(20)
                    .offset(y: 150)
                    : nil
            }
            .onAppear(perform: {
                sizeCheck()
            })
        
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}

