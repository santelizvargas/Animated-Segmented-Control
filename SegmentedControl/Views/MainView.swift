//
//  MainView.swift
//  SegmentedControl
//
//  Created by Steven Santeliz on 15/4/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        VStack {
            SegmentedControlView(items: ColorOptions.allCases) { colorSelected in
                Text("Color selected: \(colorSelected.name ?? "")")
            }
            .padding()
            
            SegmentedControlView(items: ShapeOptions.allCases) { shapeSelected in
                Text("Shape selected: \(shapeSelected.name ?? "")")
            }
            .padding()
            
            SegmentedControlView(items: EmojiOptions.allCases) { emojiSelected in
                Image(systemName: emojiSelected.iconString ?? "")
            }
            .padding()
            
        }
    }
}

#Preview {
    MainView()
}
