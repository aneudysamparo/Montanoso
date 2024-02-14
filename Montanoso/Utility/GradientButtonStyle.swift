//
//  GradientButtonStyle.swift
//  Montanoso
//
//  Created by Aneudys Amparo on 13/2/24.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                
                configuration.isPressed ? // Pressed
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                        .customGrayLight
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                : // Released
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium
                    ], 
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
