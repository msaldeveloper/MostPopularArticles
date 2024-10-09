//
//  emailedView.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct emailedView: View {
    var session = Session()
    var body: some View {
        Text("Emailed").onAppear(perform: {
            session.urlSesionInit()
        })
    }
}

#Preview {
    emailedView()
}
