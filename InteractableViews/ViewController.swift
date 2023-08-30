//
//  ViewController.swift
//  InteractableViews
//
//  Created by Mykhailo Lysenko on 8/30/23.
//

import UIKit

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

class ViewController: UIViewController {
    @IBOutlet private var buttonWithoutAccessability: IButton!
    @IBOutlet private var buttonWithAccessability: IButton!
    @IBOutlet private var textView: ITextView!
    @IBOutlet private var textField: ITextField!
    @IBOutlet private var slider: ISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNames()
        let interactableViews = fetchInteractableViews()
        logInteractable(views: interactableViews)
    }
    
    private func setupNames() {
        buttonWithAccessability.name = "buttonWithAccessability"
        buttonWithoutAccessability.name = "buttonWithoutAccessability"
        textView.name = "textView"
        textField.name = "textField"
        slider.name = "slider"
    }
    
    private func fetchInteractableViews() -> [UIView] {
        let subviews = getSubviewsOfView(view: view)
        return subviews.filter { $0 is InteractableView }
    }
    
    private func logInteractable(views: [UIView]) {
        views.forEach {
            if let view = $0 as? UIView & InteractableView {
                let name = view.name!
                let label = view.accessibilityLabel ?? "Error"
                let id = view.accessibilityIdentifier ?? "Error"
                
                print("\nView name:\t\(name)\nview label:\t\(label)\nview id:\t\(id)")
            }
        }
    }
    
    // MARK: - Helpers
    func getSubviewsOfView(view: UIView) -> [UIView] {
        var subviewArray = [UIView]()
        if view.subviews.count == 0 {
            return subviewArray
        }
        for subview in view.subviews {
            subviewArray += self.getSubviewsOfView(view: subview)
            subviewArray.append(subview)
        }
        return subviewArray
    }
}

