//
//  LinkButton.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import SwiftUI

struct LinkButton: View {
    var title: String
    var callback: () -> Void
    
    var body: some View {
        Button(action: callback) {
            HStack {
                Image(systemName: "mail")
                Text(title)
            }
        }
    }
}

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        LinkButton(title: "test@gmail.com,", callback: {
            print("❗️DEBUG: tapped ")
        })
    }
}
