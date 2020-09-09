//
//  MaterialVerticalButton.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 20.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit
import SnapKit

class MaterialVerticalButton: UIControl {
    
    // MARK: - Public Properties
    
    var imageView: UIImageView!
    
    var icon: UIImage = UIImage() {
        didSet {
            self.imageView.image = self.icon
        }
    }
    
    ///The boolean to set whether the segment control displays the original color of the icon.
    var preserveIconColor: Bool = false {
        didSet {
            self.icon = preserveIconColor ? self.icon : self.icon.colored(foregroundColor)!
        }
    }
    
    private var imgHeightContraint: NSLayoutConstraint?
    
    var elevation: CGFloat = 0 {
        didSet {
            rippleLayer.elevation = elevation
        }
    }
    
    ///The corner radius of the button. Used to round the corner.
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.setCornerBorder(color: borderColor,
                                 cornerRadius: cornerRadius)
            rippleLayer.superLayerDidResize()
        }
    }
    
    ///The border color of the button. The default value is set to transparent.
    var borderColor: UIColor = .clear {
        didSet {
            self.setCornerBorder(color: borderColor,
                                 cornerRadius: cornerRadius)
        }
    }
    
    var shadowOffset: CGSize = .zero {
        didSet {
            rippleLayer.shadowOffset = shadowOffset
        }
    }
    
    var roundingCorners: UIRectCorner = UIRectCorner.allCorners {
        didSet {
            rippleLayer.roundingCorners = roundingCorners
        }
    }
    
    var maskEnabled: Bool = true {
        didSet {
            rippleLayer.maskEnabled = maskEnabled
        }
    }
    
    var rippleScaleRatio: CGFloat = 1.0 {
        didSet {
            rippleLayer.rippleScaleRatio = rippleScaleRatio
        }
    }
    
    var rippleDuration: CFTimeInterval = 0.35 {
        didSet {
            rippleLayer.rippleDuration = rippleDuration
        }
    }
    var rippleEnabled: Bool = true {
        didSet {
            rippleLayer.rippleEnabled = rippleEnabled
        }
    }
    var rippleLayerColor: UIColor = .lightGray {
        didSet {
            rippleLayer.setRippleColor(color: rippleLayerColor)
        }
    }
    var backgroundAnimationEnabled: Bool = true {
        didSet {
            rippleLayer.backgroundAnimationEnabled = backgroundAnimationEnabled
        }
    }
    
    override var bounds: CGRect {
        didSet {
            rippleLayer.superLayerDidResize()
        }
    }
    
    ///Vertical button style for light mode and dark mode use.
    public enum VerticalButtonStyle {
        case fill
        case outline
    }
    
    ///The background color of the button.
    var bgColor: UIColor = .darkGray {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    ///The foreground color of the button.
    var foregroundColor: UIColor = .white {
        didSet {
            self.icon = preserveIconColor ? icon : icon.colored(foregroundColor)!
        }
    }
  
    lazy var rippleLayer: RippleLayer = RippleLayer(withView: self)
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func defaultSetup() {
        imageView = UIImageView()
        setupLayer()
        addViews()
    }
    /**
     Convenience init of material design vertical aligned button with required parameters.
     
     - Parameter icon:            The icon of the button.
     - Parameter text:            The title of the button.
     - Parameter font:            The font of the button title.
     - Parameter foregroundColor: The foreground color of the button. It applies to title. It applies to icon if the useOriginalImg is false.
     - Parameter bgColor:         The background color of the button.
     - Parameter useOriginalImg:  To determine whether use the original button image or paint it with color.
     - Parameter cornerRadius:    The corner radius of the button. Used to set rounded corner.
    */
    convenience init(icon: UIImage,
                     font: UIFont? = nil,
                     foregroundColor: UIColor,
                     bgColor: UIColor,
                     borderColor: UIColor? = nil,
                     preserveIconColor: Bool = true,
                     cornerRadius: CGFloat = 0.0) {
        
        self.init()
        
        defer {
            self.icon = icon
            self.preserveIconColor = preserveIconColor
            self.foregroundColor = foregroundColor
            self.cornerRadius = cornerRadius
            if let borderColor = borderColor {
                self.borderColor = borderColor
            }
        }
        
        self.backgroundColor = bgColor
        setupLayer()
        addViews()
    }
    /**
     Convenience init of material design vertical aligned button using system default colors. This initializer
     reflects dark mode colors on iOS 13 or later platforms. However, it will ignore any custom colors
     set to the vertical aligned button.
     
     - Parameter icon:           The icon of the button.
     - Parameter text:           The title of the button.
     - Parameter font:           The font of the button title.
     - Parameter preserveIconColor: To determine whether use the original button image or paint it with color.
     - Parameter cornerRadius:   The corner radius of the button. Used to set rounded corner.
    */
    convenience init(icon: UIImage, text: String, font: UIFont? = nil,
                            preserveIconColor: Bool = true, cornerRadius: CGFloat = 0.0, buttonStyle: VerticalButtonStyle) {
        switch buttonStyle {
        case .fill:
            self.init(icon: icon, font: font, foregroundColor: UIColor.Pallete.black, bgColor: .systemGray3,
                      preserveIconColor: preserveIconColor, cornerRadius: cornerRadius)
        case .outline:
            self.init(icon: icon, font: font, foregroundColor: UIColor.Pallete.black, bgColor: .clear, borderColor: UIColor.Pallete.black,
                      preserveIconColor: preserveIconColor, cornerRadius: cornerRadius)
        }
    }
    
    func addViews() {
        [imageView].forEach {
            self.addSubview($0.unsafelyUnwrapped)
            $0?.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    fileprivate func setupLayer() {
        rippleLayer.elevation = self.elevation
        self.layer.cornerRadius = self.cornerRadius
        rippleLayer.elevationOffset = self.shadowOffset
        rippleLayer.roundingCorners = self.roundingCorners
        rippleLayer.maskEnabled = self.maskEnabled
        rippleLayer.rippleScaleRatio = self.rippleScaleRatio
        rippleLayer.rippleDuration = self.rippleDuration
        rippleLayer.rippleEnabled = self.rippleEnabled
        rippleLayer.backgroundAnimationEnabled = self.backgroundAnimationEnabled
        rippleLayer.setRippleColor(color: self.rippleLayerColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.frame.width
        let height = self.frame.height
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.03*height)
            make.leading.equalToSuperview().offset(0.1*width)
            make.trailing.equalToSuperview().offset(-0.1*width)
        }
        if imgHeightContraint != nil {
            imgHeightContraint.unsafelyUnwrapped.isActive = false
        }
        imgHeightContraint = imageView.heightAnchor.constraint(equalToConstant: height - 2*0.03*height)
        imgHeightContraint?.isActive = true

        self.layoutIfNeeded()
    }
    
    
    // MARK: - HandleTouches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        rippleLayer.touchesBegan(touches: touches, withEvent: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        rippleLayer.touchesEnded(touches: touches, withEvent: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        rippleLayer.touchesCancelled(touches: touches, withEvent: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        rippleLayer.touchesMoved(touches: touches, withEvent: event)
    }
}
