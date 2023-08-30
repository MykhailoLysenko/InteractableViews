//
//  InteractableViews.swift
//  InteractableViews
//
//  Created by Mykhailo Lysenko on 8/30/23.
//

import UIKit

// MARK: - InteractableView Protocol
//enum Interaction {
//    case tap
//    case scroll
//    case swipe
//}

protocol InteractableView {
    var name: String? { get set } // for printing purposes
//    var interactionType: Interaction { get }
    
}

extension InteractableView {
    var name: String { "undefined" }
}

// MARK: - Custom InteractableViews
class IButton: UIButton, InteractableView {
    var name: String?
}
class ITextView: UITextView, InteractableView {
    var name: String?
}
class ITextField: UITextField, InteractableView {
    var name: String?
}
class ISlider: UISlider, InteractableView {
    var name: String?
}
