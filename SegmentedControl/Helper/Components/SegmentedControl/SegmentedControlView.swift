//
//  SegmentedControlView.swift
//  SegmentedControl
//
//  Created by Steven Santeliz on 15/4/24.
//

import SwiftUI


// MARK: - Reusable Segmented Control

struct SegmentedControlView<Segment: SegmentControlItem, Content: View>: View {
    private typealias Constants = SegmentedControlConstants
    
    @State private var selectedItem: Segment?
    private let items: [Segment]
    private let content: (Segment) -> Content
    
    init(items: [Segment],
         @ViewBuilder _ content: @escaping (Segment) -> Content) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        VStack {
            ZStack {
                readerView
                itemsView
            }
            .frame(height: Constants.height)
            .background(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(.black.opacity(Constants.opacity))
            )
            
            if let selectedItem { content(selectedItem) }
        }
        .onAppear {
            self.selectedItem = items.first
        }
    }
    
    private var readerView: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(.white)
                .padding(Constants.Reader.padding)
                .frame(width: proxy.size.width / CGFloat(items.count))
                .shadow(
                    color: .black.opacity(Constants.Reader.opacity),
                    radius: Constants.Reader.radius,
                    x: Constants.Reader.position,
                    y: Constants.Reader.position
                )
                .offset(
                    x: proxy.size.width / CGFloat(items.count) * CGFloat(selectedItem?.id ?? 0),
                    y: Constants.Item.noSpacing
                )
        }
    }
    
    private var itemsView: some View {
        HStack(spacing: Constants.Item.noSpacing) {
            ForEach(items) { item in
                HStack(spacing: Constants.cornerRadius) {
                    if let icon = item.iconString {
                        Image(systemName: icon)
                    }
                    
                    if let name = item.name {
                        Text(name)
                    }
                }
                .font(.system(size: Constants.Item.fontSize))
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: Constants.Item.duration)) {
                        selectedItem = item
                    }
                }
            }
        }
    }
}
