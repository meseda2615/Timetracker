//
//  HomeView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//

import SwiftUI

struct CategoryView: View {
    
    
    let twoColumns = [GridItem(spacing: 12), GridItem(spacing: 12)]
    
    
    var body: some View {
        
        
        VStack(spacing: 12) {
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Super Title")
                    Text("Sub title result")
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color.black)
                        .font(.system(size: 28))
                }
                
                    
            }.fillMaxWidth()
            
            LazyVGrid(columns: twoColumns,spacing: 20) {
                ForEach(0 ..< 6) { item in
                    
                    VStack {
                        Image(systemName: "\(item).circle")
                            .screenHeight(0.24)
                            .screenWidth(0.44)
                    }
                    
                    .background(Color.purple)
                    
                }
                
            }
            
            TimeButtonView(text: "Start to track") {
                
            }
        }.onAppear {
            UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
        }
        
        .fillMaxSize()
        .padding(.horizontal,16)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
