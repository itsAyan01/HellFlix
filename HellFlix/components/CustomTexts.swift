//
//  CustomTexts.swift
//  HellFlix
//
//  Created by Ayan Ansari on 27/04/23.
//

import SwiftUI

struct CustomTexts: View {
    var body: some View {
        TextWithAttributes(text: "Hello hi there",
                           font: .caption2,
                           fontWeight: .bold,
                           color: .accentColor)
    }
}

struct CustomTexts_Previews: PreviewProvider {
    static var previews: some View {
        CustomTexts()
    }
}

struct TextWithAttributes: View {
    let text: String
    let font: Font
    let fontWeight: Font.Weight
    let color: Color
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(fontWeight)
            .foregroundColor(color)
    }
    
}
