//
//  BlankView.swift
//  ToDoList
//
//  Created by Jacek Kosiński G on 01/01/2023.
//

import SwiftUI

struct BlankView : View {

    var bgColor: Color

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(bgColor: .black)
            .opacity(0.5)
     
    }
}
