//
//  Images.swift
//  MultiplyImagePicker
//
//  Created by Burak AYVAZ on 19.06.2020.
//  Copyright © 2020 Burak AYVAZ. All rights reserved.
//

import UIKit
import ImageSlideshow

class Images: UIViewController {
    
    
    var sourceArray = [ImageSource]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 36, y: 40, width: 346, height: 661))
        imageView.isHidden = true
        
        if PlaceVariables.sharedVariables.imageArray.count > 1 {

            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.9, height: self.view.frame.height * 0.9))
            imageSlideShow.backgroundColor = .white
            
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = .gray
            pageIndicator.pageIndicatorTintColor = .black
            imageSlideShow.pageIndicator = pageIndicator
            
            if PlaceVariables.sharedVariables.imageArray.count == 2 {
                let source = ImageSource(image: PlaceVariables.sharedVariables.imageArray[0])
                let source2 = ImageSource(image: PlaceVariables.sharedVariables.imageArray[1])
                
                sourceArray.append(source)
                sourceArray.append(source2)
                
                imageSlideShow.contentScaleMode = .scaleAspectFill
                
                imageSlideShow.setImageInputs(sourceArray)
                
                view.addSubview(imageSlideShow)
            } else if PlaceVariables.sharedVariables.imageArray.count == 3 {
                
                let source = ImageSource(image: PlaceVariables.sharedVariables.imageArray[0])
                let source2 = ImageSource(image: PlaceVariables.sharedVariables.imageArray[1])
                let source3 = ImageSource(image: PlaceVariables.sharedVariables.imageArray[2])
                
                sourceArray.append(source)
                sourceArray.append(source2)
                sourceArray.append(source3)
                
                imageSlideShow.contentScaleMode = .scaleAspectFill
                
                imageSlideShow.setImageInputs(sourceArray)
                
                view.addSubview(imageSlideShow)
            }
            
        
        } else {
            imageView.isHidden = false
            imageView.image = PlaceVariables.sharedVariables.imageArray[0]
            view.addSubview(imageView)
            
        }
        
        

    }
    


}
