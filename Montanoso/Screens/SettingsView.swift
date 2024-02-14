//
//  SettingsView.swift
//  Montanoso
//
//  Created by Aneudys Amparo on 13/2/24.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    
    var body: some View {
        List {
            // MARK: - HEADER
            
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack {
                        Text("Hike")
                            .font(.system(size: 64, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgerous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            }//: HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - ICONS
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                print("Button pressed \(alternateAppIcons[item])")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Error changing app icon form \(alternateAppIcons[item])")
                                    } else {
                                        print("Success changing app icon for \(alternateAppIcons[item])")
                                    }
                                    
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }//: Scroll View
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // Basic
                //LabeledContent("Application", value: "Hike")
                
                // Advanced
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "Montanoso",
                    rowTintColor: .blue)
                
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "macbook",
                    rowContent: "Aneudys Amparo",
                    rowTintColor: .green)
                
                CustomListRowView(
                    rowLabel: "Devices OS",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red)
                
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0.1",
                    rowTintColor: .pink)
                
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowContent: nil,
                    rowTintColor: .teal,
                    rowLinkLabel: "Aneudys Amparo",
                    rowLinkDestination: "aneudysamparo.com")
            }
        }
    }
}

#Preview {
    SettingsView()
}
