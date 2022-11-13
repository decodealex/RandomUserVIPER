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
        VStack {
            Text("UserList")
        }
        .onAppear {
            self.presenter.viewDidAppear()
        }
	}
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListRouter.buildModuleView()
    }
}


   

