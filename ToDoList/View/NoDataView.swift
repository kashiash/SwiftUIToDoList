//
//  NoDataView.swift
//  ToDoList
//
//  Created by Jacek Kosiński G on 01/01/2023.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        Image("welcome")
            .resizable()
            .scaledToFit()
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
