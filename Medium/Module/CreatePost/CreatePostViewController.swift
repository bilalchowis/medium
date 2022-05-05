//
//  CreatePostViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit
import PhotosUI

protocol CreatePostDisplayLogic: AnyObject {
    /* DEFAULT */
}

class CreatePostViewController: BaseViewController, CreatePostDisplayLogic {
    let dwgConst = DrawingConstants()
    var presenter: CreatePostPresentationLogic!
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = dwgConst.cornerRadius
        view.backgroundColor = .secondaryBackground
        view.accessibilityLabel = "contentView"
        view.translatesAutoresizingMaskIntoConstraints = false
        registerDropShadow(view.accessibilityLabel)
        
        return view
    }()
    
    private(set) lazy var textView: TextView = {
        let view = TextView()
        view.setFont(.body1)
        view.setTextColor(.lightGray)
        view.text = "Write something..."
        view.backgroundColor = .clear
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var imageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "img_add"), for: .normal)
        view.setImage(UIImage(named: "img_add"), for: .highlighted)
        view.imageView?.contentMode = .scaleAspectFill
        view.addTarget(self, action: #selector(handleImageButtonClick), for: .touchUpInside)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var submitButton: Button = {
        let view = Button()
        view.setTitle("Submit", for: .normal)
        view.backgroundColor = UIColor.accent.withAlphaComponent(0.5)
        view.addTarget(self, action: #selector(handleSubmitButtonClick), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var pickerController: UIViewController = {
        if #available(iOS 14.0, *) {
            var configuration = PHPickerConfiguration()
            configuration.filter = .any(of: [.images])
            
            let viewController = PHPickerViewController(configuration: configuration)
            viewController.overrideUserInterfaceStyle = GeneralPreferences.shared.userInterfaceStyle
            viewController.delegate = self
            
            return viewController
        } else {
            let viewController = UIImagePickerController()
            viewController.mediaTypes = ["public.image"]
            viewController.sourceType = .photoLibrary
            
            return viewController
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .primaryBackground
        setBackButton(for: navigationItem)
        setNavigationTitle("Create Post")
        setupSubviews()
        disableSubmitButton()
        presenter.viewDidLoad()
                
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func enableSubmitButton() {
        submitButton.isEnabled = true
    }
    
    private func disableSubmitButton() {
        submitButton.isEnabled = false
    }
    
    private func apply(image: UIImage) {
        DispatchQueue.main.async {
            self.imageButton.setImage(image, for: .normal)
            self.imageButton.setImage(image, for: .highlighted)
            self.presenter.willSet(image: image)
        }
    }
    
    // MARK: - Action
    @objc private func handleTapGesture() {
        view.endEditing(true)
    }
    
    @objc private func handleImageButtonClick() {
        present(pickerController, animated: true, completion: nil)
    }
    
    @objc private func handleSubmitButtonClick() {
        presenter.willSubmit()
    }
}

extension CreatePostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .lightGray else { return }
        
        textView.text = nil
        textView.textColor = .primaryLabel
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.text.isEmpty else {
            enableSubmitButton()
            return
        }
        
        textView.text = "Write something..."
        textView.textColor = .lightGray
        disableSubmitButton()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text else { return }
        
        presenter.willSet(post: text)
        text.isEmpty ? disableSubmitButton() : enableSubmitButton()
    }
}

@available(iOS 14.0, *)
extension CreatePostViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // Dimiss picker.
        picker.dismiss(animated: true, completion: nil)
        // Get ItemProvider.
        guard let pickerResult = results.first else { return }
        // Load image.
        pickerResult.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            guard let self = self else { return }
            guard let image = (image as? UIImage) else { return }
            self.apply(image: image)
        }
    }
}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Close picker.
        dismiss(animated: true, completion: nil)
        // Get picked image.
        guard let image = info[.originalImage] as? UIImage else { return }
        // Save image.
        self.apply(image: image)
    }
}
