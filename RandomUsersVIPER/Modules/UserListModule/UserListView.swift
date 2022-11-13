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
        switch presenter.state {
        case .loaded:
            List {
                ForEach(presenter.users, id: \.self) { user in
                    Button {
                        presenter.tappedOn(user)
                    } label: {
                        Text(user.name.fullName)
                            .foregroundColor(.black)
                    }
                }
            }
        case .loading:
            ProgressView("Loading data...")
                .font(.title)
                .onAppear {
                    self.presenter.viewDidAppear()
                }
        case .error:
            ErrorView()
        }
	}
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListRouter.buildModuleView()
    }
}


