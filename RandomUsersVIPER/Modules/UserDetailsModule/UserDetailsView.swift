//
//  UserDetailsView.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import SwiftUI

struct UserDetailsView<Presenter>: View where Presenter: UserDetailsPresentable {
    @ObservedObject var presenter: Presenter

    var body: some View {
        VStack(alignment: .center) {
            imageView
                .padding(.top, 20)
            Form {
                if let user = presenter.user {
                    LinkButton(title: user.email, callback: presenter.tappedEmail)
                }
                Section(header: Text("User information:")) {
                    ForEach(presenter.rows, id: \.self) {
                        FormInfoRow(title: $0.title, value: $0.value)
                    }
                }
            }
        }
        .onAppear {
            self.presenter.viewDidAppear()
        }
	}
    
    var imageView: some View {
        AsyncImage(url: presenter.user?.picture.large) { image in
            image
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(100/2)
                .overlay(
                    RoundedRectangle(cornerRadius: 100 / 2)
                        .stroke(.gray.opacity(0.7), lineWidth: 2)
                )
        } placeholder: {
            Image(systemName: "person.circle.fill")
                .renderingMode(.template)
                .foregroundColor(.gray.opacity(0.7))
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static private let user = User(name: User.Name(title: "Mr", first: "Alex", last: "Test"), email: "ales.developer@test.com", picture: User.Picture(large: URL(string: "https://randomuser.me/api/portraits/med/men/39.jpg")!))
    static var previews: some View {
        UserDetailsRouter.buildModuleView(for: user)
    }
}
