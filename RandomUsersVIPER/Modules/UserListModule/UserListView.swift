//
//  UserListView.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import SwiftUI

struct UserListView<Presenter>: View where Presenter: UserListPresentable {
    @ObservedObject var presenter: Presenter

    var body: some View {
        List {
            ForEach(presenter.users, id: \.self) { user in
                DisclosureIndicatorRow {
                    print("❗️DEBUG: Tapped ")
                } label: {
                    Text(user.name.fullName)
                }
            }
        }
        .onAppear {
            print("❗️DEBUG: appeared ")
            self.presenter.viewDidAppear()
        }
	}
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListRouter.buildModuleView()
    }
}
