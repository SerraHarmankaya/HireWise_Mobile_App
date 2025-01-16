//
//  FollowView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 25.10.2024.
//

import SwiftUI

struct FollowView: View {
    
    var count: Int
    var title: String
    
    var body: some View {
        HStack {
            Text("\(count)")
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}

/*#Preview {
    FollowView()
}
*/
