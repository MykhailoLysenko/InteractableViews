//
//  ViewController.swift
//  InteractableViews
//
//  Created by Mykhailo Lysenko on 8/30/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private var buttonWithoutAccessability: IButton!
    @IBOutlet private var buttonWithAccessability: IButton!
    @IBOutlet private var textView: ITextView!
    @IBOutlet private var textField: ITextField!
    @IBOutlet private var slider: ISlider!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNames()
        let interactableViews = fetchInteractableViews()
        logInteractable(views: interactableViews)
    }
    
    // MARK: - Setup
    private func setupNames() {
        buttonWithAccessability.name = "buttonWithAccessability"
        buttonWithoutAccessability.name = "buttonWithoutAccessability"
        textView.name = "textView"
        textField.name = "textField"
        slider.name = "slider"
    }
}

// MARK: - InteractableView Job
extension ViewController {
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
}

// MARK: - Helpers
extension ViewController {
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
