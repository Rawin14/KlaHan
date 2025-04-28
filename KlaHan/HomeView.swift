import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
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
                
                // ปุ่มไปหน้า Scan
                NavigationLink(destination: ScanView()) {
                    Text("ไปหน้า Scan")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                
                // ปุ่มไปหน้า Profile
                NavigationLink(destination: ProfileView()) {
                    Text("ไปหน้า Profile")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    HomeView()
}
