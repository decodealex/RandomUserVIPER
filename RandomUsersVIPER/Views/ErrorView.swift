//
//  ErrorView.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Text("Unable to load data 🙁")
            
            Image(systemName: "circle.grid.hex.fill")
                .resizable()
                .frame(width: 70.0, height: 70.0)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
