//
//  MaterialButton.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 20.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

open class MaterialButton: UIButton {
    
    var maskEnabled: Bool = true {
        didSet {
            rippleLayer.maskEnabled = maskEnabled
        }
    }
    
    ///The corner radius of the button. Used to round the corner.
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.setCornerBorder(color: borderColor, cornerRadius: cornerRadius)
            rippleLayer.superLayerDidResize()
        }
    }
    
    ///The border color of the button. The default value is set to transparent.
    var borderColor: UIColor = .clear {
        didSet {
            self.setCornerBorder(color: borderColor, cornerRadius: cornerRadius)
        }
    }
    var elevation: CGFloat = 0 {
        didSet {
            rippleLayer.elevation = elevation
        }
    }
    open var shadowOffset: CGSize = CGSize.zero {
        didSet {
            rippleLayer.shadowOffset = shadowOffset
        }
    }
    open var roundingCorners: UIRectCorner = UIRectCorner.allCorners {
        didSet {
            rippleLayer.roundingCorners = roundingCorners
        }
    }
    var rippleEnabled: Bool = true {
        didSet {
            rippleLayer.rippleEnabled = rippleEnabled
        }
    }
    var rippleDuration: CFTimeInterval = 0.35 {
        didSet {
            rippleLayer.rippleDuration = rippleDuration
        }
    }
    var rippleScaleRatio: CGFloat = 1.0 {
        didSet {
            rippleLayer.rippleScaleRatio = rippleScaleRatio
        }
    }
    var rippleLayerColor: UIColor = UIColor.Pallete.lightGreen {
        didSet {
            rippleLayer.setRippleColor(color: rippleLayerColor)
        }
    }
    var rippleLayerAlpha: CGFloat = 0.3 {
        didSet {
            rippleLayer.setRippleColor(color: rippleLayerColor,
                                       withRippleAlpha: rippleLayerAlpha,
                                       withBackgroundAlpha: rippleLayerAlpha)
        }
    }
    var backgroundAnimationEnabled: Bool = true {
        didSet {
            rippleLayer.backgroundAnimationEnabled = backgroundAnimationEnabled
        }
    }
    
    ///The boolean to determine if the button shows a shadow.
    var withShadow: Bool = false {
        didSet {
            resetShadow()
        }
    }
    
    ///The background color of the button.
    var bgColor: UIColor = .darkGray {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    ///Button style for light mode and dark mode use. Only available on iOS 13 or later.
    enum ButtonStyle {
        case fill
        case outline
    }
    
    var shadowAdded: Bool = false
    var shadowLayer: UIView?
    private var loaderWorkItem: DispatchWorkItem?
    
    override open var bounds: CGRect {
        didSet {
            rippleLayer.superLayerDidResize()
        }
    }
    
    fileprivate lazy var rippleLayer: RippleLayer = RippleLayer(withView: self)
    
    // MARK: Init
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    func getEntireView() -> [UIView] {
        var views: [UIView] = [self]
        if let shadow = self.shadowLayer {
            views.append(shadow)
        }
        return views
    }
    /**
     Convenience init of theme button with required information
     
     - Parameter icon:         the icon of the button, it is be nil by default.
     - Parameter text:         the title of the button.
     - Parameter font:         the font of the button label.
     - Parameter textColor:    the text color of the button.
     - Parameter bgColor:      the background color of the button, tint color will be automatically generated.
     - Parameter cornerRadius: the corner radius of the button. It is set to 12.0 by default.
     - Parameter withShadow:   set true to show the shadow of the button.
     */
    convenience init(icon: UIImage? = nil, text: String? = nil, font: UIFont? = nil,
                            textColor: UIColor? = nil, bgColor: UIColor, borderColor: UIColor? = nil,
                            cornerRadius: CGFloat = 0.0, withShadow: Bool = false) {
        self.init()
        
        self.rippleLayerColor = bgColor.getColorTint()
        if let icon = icon {
            self.setImage(icon)
        }
        
        if let text = text {
            self.setTitle(text)
            self.setTitleColor(textColor, for: .normal)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
        }
        
        if let font = font {
            self.titleLabel?.font = font
        }
        
        if bgColor == self.indicator.color {
            self.indicator.color = .white
        }
        
        self.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        self.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        // Execute immediately
        defer {
            // Set border and corner radius
            self.cornerRadius = cornerRadius
            if let borderColor = borderColor {
                self.borderColor = borderColor
            }
            self.bgColor = bgColor
        }
        self.withShadow = withShadow
        setupLayer()
    }
    /**
     Convenience init of material design button using system default colors. This initializer
     reflects dark mode colors on iOS 13 or later platforms. However, it will ignore any custom
     colors set to the button.
     
     - Parameter icon:         the icon of the button, it is be nil by default.
     - Parameter text:         the title of the button.
     - Parameter font:         the font of the button label.
     - Parameter cornerRadius: the corner radius of the button. It is set to 12.0 by default.
     - Parameter withShadow:   set true to show the shadow of the button.
     - Parameter buttonStyle:  specify the button style. Styles currently available are fill and outline.
    */
   
    convenience init(icon: UIImage? = nil, text: String? = nil, font: UIFont? = nil,
                            cornerRadius: CGFloat = 0.0, withShadow: Bool = false, buttonStyle: ButtonStyle) {
        switch buttonStyle {
        case .fill:
            self.init(icon: icon, text: text, font: font, textColor: .label, bgColor: .systemGray3,
                      cornerRadius: cornerRadius, withShadow: withShadow)
        case .outline:
            self.init(icon: icon, text: text, font: font, textColor: .label, bgColor: .clear, borderColor: .label,
                      cornerRadius: cornerRadius, withShadow: withShadow)
        }
        self.indicator.color = .label
    }
    
    func setTextStyles(textColor: UIColor? = nil,
                       font: UIFont? = nil) {
        self.setTitleColor(textColor, for: .normal)
        if let font = font {
            self.titleLabel?.font = font
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }
    
    // MARK: Setup
    fileprivate func setupLayer() {
        rippleLayer = RippleLayer(withView: self)
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
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        indicator.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
    }
    
    // MARK: - Loading, refer to pmusolino/PMSuperButton on Github
    
    let indicator = MaterialLoadingIndicator()
    public var isLoading: Bool = false
    
    /**
     Show a loader inside the button, and enable or disable user interection while loading
     */
    func showLoader(userInteraction: Bool = false, _ completion: BtnAction = nil) {
        showLoader([self.titleLabel, self.imageView], userInteraction: userInteraction, completion)
    }
    /**
     Display the loader inside the button.
     
     - Parameter viewsToBeHidden: The views such as titleLabel, imageViewto be hidden while showing loading indicator.
     - Parameter userInteraction: Enable the user interaction while displaying the loader.
     - Parameter completion:      The completion handler.
    */
    func showLoader(_ viewsToBeHidden: [UIView?], userInteraction: Bool = false, _ completion: BtnAction = nil) {
        guard self.subviews.contains(indicator) == false else { return }
        // Set up loading indicator and update loading state
        isLoading = true
        self.isUserInteractionEnabled = userInteraction
        indicator.radius = min(0.7*self.frame.height/2, indicator.radius)
        indicator.alpha = 0.0
        self.addSubview(self.indicator)
        // Clean up
        loaderWorkItem?.cancel()
        loaderWorkItem = nil
        // Create a new work item
        loaderWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self, let item = self.loaderWorkItem, !item.isCancelled else { return }
            UIView.transition(with: self, duration: 0.2, options: .curveEaseOut, animations: {
                viewsToBeHidden.forEach {
                    $0?.alpha = 0.0
                }
                self.indicator.alpha = 1.0
            }) { _ in
                guard !item.isCancelled else { return }
                self.isLoading ? self.indicator.startAnimating() : self.hideLoader()
                completion?()
            }
        }
        loaderWorkItem?.perform()
    }
    /**
     Show a loader inside the button with image.
     */
    func showLoaderWithImage(userInteraction: Bool = false){
        showLoader([self.titleLabel], userInteraction: userInteraction)
    }
    /**
    Hide the loader displayed.
    
    - Parameter completion: The completion handler.
    */
    func hideLoader(_ completion: BtnAction = nil) {
        guard self.subviews.contains(indicator) == true else { return }
        // Update loading state
        isLoading = false
        self.isUserInteractionEnabled = true
        indicator.stopAnimating()
        // Clean up
        indicator.removeFromSuperview()
        loaderWorkItem?.cancel()
        loaderWorkItem = nil
        // Create a new work item
        loaderWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self, let item = self.loaderWorkItem, !item.isCancelled else { return }
            UIView.transition(with: self, duration: 0.2, options: .curveEaseIn, animations: {
                self.titleLabel?.alpha = 1.0
                self.imageView?.alpha = 1.0
            }) { _ in
                guard !item.isCancelled else { return }
                completion?()
            }
        }
        loaderWorkItem?.perform()
    }
    
    func fillContent() {
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
    }
    
    open override func removeFromSuperview() {
        super.removeFromSuperview()
        shadowLayer?.removeFromSuperview()
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded || !withShadow { return }
        shadowAdded = true

        shadowLayer = UIView(frame: self.frame)
        guard let shadowLayer = shadowLayer else { return }
        if #available(iOS 13.0, *) {
            shadowLayer.setAsShadow(bounds: bounds, cornerRadius: self.cornerRadius, color: .systemGray3)
        } else {
            shadowLayer.setAsShadow(bounds: bounds, cornerRadius: self.cornerRadius, color: .lightGray)
        }
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        resetShadow()
    }
    
    private func resetShadow() {
        if let shadowLayer = shadowLayer  {
            shadowLayer.removeFromSuperview()
            shadowAdded = false
            draw(self.frame)
        }
    }
    
    // MARK: Touch
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        rippleLayer.touchesBegan(touches: touches, withEvent: event)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        rippleLayer.touchesEnded(touches: touches, withEvent: event)
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        rippleLayer.touchesCancelled(touches: touches, withEvent: event)
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        rippleLayer.touchesMoved(touches: touches, withEvent: event)
    }
}
