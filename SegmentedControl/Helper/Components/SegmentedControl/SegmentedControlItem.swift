//
//  SegmentedControlItem.swift
//  SegmentedControl
//
//  Created by Steven Santeliz on 15/4/24.
//

import Foundation

protocol SegmentControlItem: CaseIterable, Identifiable {
    var id: Int { get }
    var name: String? { get }
    var iconString: String? { get }
}
