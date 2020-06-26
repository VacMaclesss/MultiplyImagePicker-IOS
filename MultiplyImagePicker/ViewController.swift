//
//  ViewController.swift
//  MultiplyImagePicker
//
//  Created by Burak AYVAZ on 19.06.2020.
//  Copyright © 2020 Burak AYVAZ. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos


class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    @objc func selectImage() {
        let picker = ImagePickerController()
        picker.settings.selection.max = 3
        picker.settings.theme.selectionStyle = .numbered
        picker.settings.selection.unselectOnReachingMax = true
        picker.settings.fetch.assets.supportedMediaTypes = [.image]
        var assetArray = [PHAsset]()
        self.presentImagePicker(picker, animated: true, select: { (asset) in
            
        }, deselect: { (asset) in
            
        }, cancel: { (asset) in
            
        }, finish: { (asset) in
            
            assetArray.append(contentsOf: picker.selectedAssets)
            PlaceVariables.sharedVariables.imageArray.append(contentsOf: self.assetToImage(asset: assetArray))
            
            
        }) {
            
            
            
        }
        
        
        
        /*picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker,animated: true,completion: nil)*/
    }
    
    /*func imagePickerController(_ picker: BSImagePicker, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? PHAsset
        imageArray.append(imageView.image)
        self.dismiss(animated: true, completion: nil)
    }*/
    

    func assetToImage(asset : [PHAsset]) -> [UIImage] {
        var resultImage = [UIImage]()
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.deliveryMode = .highQualityFormat
        options.resizeMode = .none
        
        while asset.count == 3 {
            manager.requestImage(for: asset[0], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, _) in
                if let img = image {
                    resultImage.append(img)
                }
            }
            manager.requestImage(for: asset[1], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, _) in
                if let img = image {
                    resultImage.append(img)
                }
            }
            manager.requestImage(for: asset[2], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, _) in
                if let img = image {
                    resultImage.append(img)
                }
            }
            return resultImage
            
        
        }
        
        while asset.count == 2 {
            manager.requestImage(for: asset[0], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, _) in
                if let img = image {
                    resultImage.append(img)
                }
            }
            manager.requestImage(for: asset[1], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, _) in
                if let img = image {
                    resultImage.append(img)
                }
            }
            return resultImage
        }
        
        while asset.count == 1 {
            manager.requestImage(for: asset[0], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: options) { (image, _) in
                    if let img = image {
                        resultImage.append(img)
                    }
                }
            }
            
            return resultImage
        }
        
        
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toImages", sender: nil)
    }
    

}

