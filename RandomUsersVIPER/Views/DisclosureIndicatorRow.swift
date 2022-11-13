//
//  DisclosureIndicatorRow.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import SwiftUI

struct DisclosureIndicatorRow<Label: View>: View {
    let action: () -> Void
    @ViewBuilder let label: () -> Label
    
    @State var foregroundColor: Color = .black
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                label()
                Spacer()
                Image(systemName: "chevron.right")
            }
        })
        .foregroundColor(foregroundColor)
        .buttonStyle(.borderless)
    }
}

struct DisclosureIndicatorRow_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureIndicatorRow {
            print("❗️DEBUG: Button tapped ")
        } label: {
            Text("Test Row")
        }
        
    }
}
