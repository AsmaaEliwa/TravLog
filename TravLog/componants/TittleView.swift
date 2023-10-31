//
//  TittleView.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct TittleView: View {
    var label: String
    var body: some View {
        Text(label).font(.title).font(.system(size:30 , weight: .bold)).foregroundColor(.blue)
        Divider().foregroundColor(.blue)
    }
}

#Preview {
    TittleView(label: "Sign Up")
}
