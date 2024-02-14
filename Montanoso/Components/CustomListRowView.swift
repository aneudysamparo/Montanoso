//
//  CustomListRowView.swift
//  Montanoso
//
//  Created by Aneudys Amparo on 13/2/24.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    func parseUrl(_ urlString: String) -> URL {
        return URL(string: "https://\(urlString)")!
    }
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                    Link(rowLinkLabel!, destination: parseUrl(rowLinkDestination!))
                    .foregroundColor(.pink)
                    .fontWeight(.bold)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel).fontWeight(.light)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Developer",
            rowIcon: "macbook",
            rowContent: "Aneudys Amparo",
            rowTintColor: .green)
    }
}
