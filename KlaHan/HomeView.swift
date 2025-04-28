//
//  HomeView.swift
//  KlaHan
//
//  Created by Jeerapan Chirachanchai on 28/4/2568 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Home!")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("ยินดีต้อนรับวัยรุ่นสุดหล่อสุดสวย")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("You are logged in.")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
#Preview {
    HomeView()
}
