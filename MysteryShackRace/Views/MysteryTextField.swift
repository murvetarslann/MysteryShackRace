//
//  MysteryTextField.swift
//  MysteryShackRace
//
//  Created by Mürvet Arslan on 29.01.2026.
//

import UIKit

@IBDesignable
class MysteryTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 10)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    func setupUI() {
        // Cerceve ve arkaplan
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.systemPurple.cgColor
        self.layer.cornerRadius = 12.0
        self.backgroundColor = .white
        
        // Yazı Stili
        self.textColor = .darkGray
        self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        // Placeholder Rengi (Biraz daha silik mor)
        self.attributedPlaceholder = NSAttributedString(
            string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemPurple.withAlphaComponent(0.5)]
        )
    }
    
    // Storyboard'dan ikon ismini gireceğiz (Örn: person.fill)
    @IBInspectable var iconName: String? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let iconName = iconName {
            leftViewMode = .always
            
            // SF Symbol İkonunu Oluşturma
            let image = UIImage(systemName: iconName)
            let imageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 20, height: 20)) // Konum ayarı
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = .systemPurple // İkon rengi
            
            // İkonu tutan görünmez kutu
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 20))
            view.addSubview(imageView)
            leftView = view
        } else {
            leftViewMode = .never
            leftView = nil
        }
    }
    
    // Yazının ve Placeholder'ın içeriden başlamasını sağlayan fonksiyonlar
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
