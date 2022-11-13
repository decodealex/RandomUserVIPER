//
//  FormInfoRow.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import SwiftUI

struct FormInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
    }
}

struct FormInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        FormInfoRow(title: "Title", value: "Value")
    }
}
