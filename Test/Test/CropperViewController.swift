//
//  CropperViewController.swift
//  Test
//
//  Created by Jijo on 04/10/21.
//

import UIKit
import AKImageCropperView

class CropperViewController: UIViewController {
    
    
    var image: UIImage!
    
    // MARK: - Connections:
    
    // MARK: -- Outlets
    
    private var cropView: AKImageCropperView {
        return cropViewProgrammatically ?? cropViewStoryboard
    }
    
    @IBOutlet weak var cropViewStoryboard: AKImageCropperView!
    private var cropViewProgrammatically: AKImageCropperView!
    
    @IBOutlet weak var overlayActionView: UIView!
    
    @IBOutlet weak var navigationView: UIView!
    
    var seletced = 1
    
    
    
    @IBOutlet weak var firstbutton1: UIButton!
    @IBOutlet weak var firstbutton2: UIButton!
    @IBOutlet weak var firstbutton3: UIButton!
    @IBOutlet weak var firstbutton4: UIButton!
    
    // MARK: -- Actions
    
    @IBAction func backAction(_ sender: AnyObject) {
        
        guard !cropView.isEdited else {
            
            let alertController = UIAlertController(title: "Warning!", message:
                                                        "All changes will be lost.", preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.cancel, handler: { _ in
                
                _ = self.navigationController?.popViewController(animated: true)
            }))
            
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
            
            present(alertController, animated: true, completion: nil)
            return
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cropRandomAction(_ sender: AnyObject) {
        
        //        cropView.setCropRectAnin(CGRect(x: 50, y: 200, width: 100, height: 100))
        
        
        /*
         let randomWidth = max(UInt32(cropView.configuration.cropRect.minimumSize.width), arc4random_uniform(UInt32(cropView.scrollView.frame.size.width)))
         let randomHeight = max(UInt32(cropView.configuration.cropRect.minimumSize.height), arc4random_uniform(UInt32(cropView.scrollView.frame.size.height)))
         let offsetX = CGFloat(arc4random_uniform(UInt32(cropView.scrollView.frame.size.width) - randomWidth))
         let offsetY = CGFloat(arc4random_uniform(UInt32(cropView.scrollView.frame.size.height) - randomHeight))
         
         cropView.cropRect(CGRectMake(offsetX, offsetY, CGFloat(randomWidth), CGFloat(randomHeight)))*/
    }
    
    @IBAction func randomImageAction(_ sender: AnyObject) {
        //        let images = Constants.images.flatMap { $0 }
        //        cropView.image = UIImage(named: images[Int(arc4random_uniform(UInt32(images.count)))])
        //        angle = 0.0
    }
    
    @IBAction func cropImageAction(_ sender: AnyObject) {
        
        guard let image = cropView.croppedImage else {
            return
        }
    }
    
    @IBAction func showHideOverlayAction(_ sender: AnyObject) {
        
        if cropView.isOverlayViewActive {
            
            cropView.hideOverlayView(animationDuration: 0.3)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.overlayActionView.alpha = 0
                
            }, completion: nil)
            
        } else {
            
            cropView.showOverlayView(animationDuration: 0.3)
            
            UIView.animate(withDuration: 0.3, delay: 0.3, options: UIView.AnimationOptions.curveLinear, animations: {
                self.overlayActionView.alpha = 1
                
            }, completion: nil)
            
        }
    }
    
    var angle: Double = 0.0
    
    @IBAction func rotateAction(_ sender: AnyObject) {
        
        angle += M_PI_2
        
        cropView.rotate(angle, withDuration: 0.3, completion: { _ in
            
            if self.angle == 2 * M_PI {
                self.angle = 0.0
            }
        })
    }
    
    @IBAction func resetAction(_ sender: AnyObject) {
        
        cropView.reset(animationDuration: 0.3)
        angle = 0.0
    }
    
    // MARK: -  Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        // Programmatically initialization
        
        /*
         cropViewProgrammatically = AKImageCropperView()
         */
        
        // iPhone 4.7"
        
        /*
         cropViewProgrammatically = AKImageCropperView(frame: CGRect(x: 0, y: 20.0, width: 375.0, height: 607.0))
         view.addSubview(cropViewProgrammatically)
         */
        
        // with constraints
        
        /*
         cropViewProgrammatically = AKImageCropperView()
         cropViewProgrammatically.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(cropViewProgrammatically)
         
         if #available(iOS 9.0, *) {
         
         cropViewProgrammatically.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         cropViewProgrammatically.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         topLayoutGuide.bottomAnchor.constraint(equalTo: cropViewProgrammatically.topAnchor).isActive = true
         cropViewProgrammatically.bottomAnchor.constraint(equalTo: navigationView.topAnchor).isActive = true
         
         } else {
         
         for attribute: NSLayoutAttribute in [.top, .left, .bottom, .right] {
         
         var toItem: Any?
         var toAttribute: NSLayoutAttribute!
         
         if attribute == .top {
         
         toItem = topLayoutGuide
         toAttribute = .bottom
         
         } else if attribute == .bottom {
         
         toItem = navigationView
         toAttribute = .top
         } else {
         toItem = view
         toAttribute = attribute
         }
         
         view.addConstraint(
         NSLayoutConstraint(
         item: cropViewProgrammatically,
         attribute: attribute,
         relatedBy: NSLayoutRelation.equal,
         toItem: toItem,
         attribute: toAttribute,
         multiplier: 1.0, constant: 0))
         }
         }
         */
        
        
        // Inset for overlay action view
        
        /*
         cropView.overlayView?.configuraiton.cropRectInsets.bottom = 50
         */
        
        // Custom overlay view configuration
        
        /*
         var customConfiguraiton = AKImageCropperCropViewConfiguration()
         customConfiguraiton.cropRectInsets.bottom = 50
         cropView.overlayView = CustomImageCropperOverlayView(configuraiton: customConfiguraiton)
         */
        
        cropView.delegate = self
        cropView.image = image
        firstbutton1.isSelected = true
        firstbutton2.isSelected = false
        firstbutton3.isSelected = false
        firstbutton4.isSelected = false
        cropView.showOverlayView(animationDuration: 0.3)
        
    }
    
    @IBAction func cropAction(_ sender: Any) {
        guard let image = cropView.croppedImage else {
            return
        }
        
        if seletced == 1 {
            let targetSize = CGSize(width: 320, height: 480)

            let scaledImage = image.scalePreservingAspectRatio(
                targetSize: targetSize
            )
            print("iamgeSize",scaledImage.size)
            pushedVC(ssImage: scaledImage)
        }
        
        if seletced == 2 {
            let targetSize = CGSize(width: 300, height: 400)
            let scaledImage = image.scalePreservingAspectRatio(
                targetSize: targetSize
            )
            print("iamgeSize",scaledImage.size)
            pushedVC(ssImage: scaledImage)
        }
        
        if seletced == 3 {
            let targetSize = CGSize(width: 300, height: 250)
            let scaledImage = image.scalePreservingAspectRatio(
                targetSize: targetSize
            )
            print("iamgeSize",scaledImage.size)
            pushedVC(ssImage: scaledImage)
        }
        
        if seletced == 4 {
            let targetSize = CGSize(width: 320, height: 50)
            let scaledImage = image.scalePreservingAspectRatio(
                targetSize: targetSize
            )
            print("iamgeSize",scaledImage.size)
            pushedVC(ssImage: scaledImage)
        }
    }
    
    
    @IBAction func firstAction(_ sender: Any) {
        seletced = 1
        firstbutton1.isSelected = true
        firstbutton2.isSelected = false
        firstbutton3.isSelected = false
        firstbutton4.isSelected = false
        if let over = cropView.overlayView {
            let overCrop = cropView.overlayView?.cropRect ?? CGRect(x: 0.0, y: 0.0, width: 300.0, height: 400.0)
            cropView.cropperOverlayViewDidChangeCropRect(over, CGRect(x: overCrop.minX, y: overCrop.minY, width: 320.0, height: 480.0))
        }
    }
    
    @IBAction func secondAction(_ sender: Any) {
        seletced = 2
        firstbutton1.isSelected = false
        firstbutton2.isSelected = true
        firstbutton3.isSelected = false
        firstbutton4.isSelected = false
        if let over = cropView.overlayView {
            let overCrop = cropView.overlayView?.cropRect ?? CGRect(x: 0.0, y: 0.0, width: 300.0, height: 400.0)
            cropView.cropperOverlayViewDidChangeCropRect(over, CGRect(x: overCrop.minX, y: overCrop.minY, width: 300.0, height: 400.0))
        }
    }
    
    @IBAction func thrisAction(_ sender: Any) {
        seletced = 3
        firstbutton1.isSelected = false
        firstbutton2.isSelected = false
        firstbutton3.isSelected = true
        firstbutton4.isSelected = false
        if let over = cropView.overlayView {
            let overCrop = cropView.overlayView?.cropRect ?? CGRect(x: 0.0, y: 0.0, width: 300.0, height: 400.0)
            cropView.cropperOverlayViewDidChangeCropRect(over, CGRect(x: overCrop.minX, y: overCrop.minY, width: 300.0, height: 250.0))
        }
    }
    
    @IBAction func fourthAction(_ sender: Any) {
        seletced = 4
        firstbutton1.isSelected = false
        firstbutton2.isSelected = false
        firstbutton3.isSelected = false
        firstbutton4.isSelected = true
        if let over = cropView.overlayView {
            let overCrop = cropView.overlayView?.cropRect ?? CGRect(x: 0.0, y: 0.0, width: 300.0, height: 400.0)
            cropView.cropperOverlayViewDidChangeCropRect(over, CGRect(x: overCrop.minX, y: ((overCrop.height / 2) - 50), width: 320.0, height: 50))
        }
    }
    
    func pushedVC(ssImage: UIImage) {
        
        let cropperViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImgdViewController") as! ImgdViewController
        cropperViewController.image = ssImage
        self.navigationController?.pushViewController(cropperViewController, animated: true)
    }
    
}

//  MARK: - AKImageCropperViewDelegate

extension CropperViewController: AKImageCropperViewDelegate {
    
    func imageCropperViewDidChangeCropRect(view: AKImageCropperView, cropRect rect: CGRect) {
        print("New crop rectangle: \(rect)")
    }
    
    
    
    
}
extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: targetSize.width * 1,
            height: targetSize.height * 1
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
