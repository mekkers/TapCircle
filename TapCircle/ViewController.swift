//
//  ViewController.swift
//  TapCircle
//
//  Created by igor mekkers on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var circlesArray = [UIView]()
    let circleSize = CGSize(width: 100, height: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(spawnCircle))
        self.view.addGestureRecognizer(tapRecognizer)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(goToRoot))
        self.view.addGestureRecognizer(swipeRecognizer)
        
    }
    
    @IBAction func spawnCircle(recognizer: UITapGestureRecognizer){
        let newCircle = UIView()
        newCircle.backgroundColor = .red
        
        let coordinate = recognizer.location(in: self.view)
        
        newCircle.frame.size = circleSize
        newCircle.center = coordinate
        newCircle.layer.cornerRadius = circleSize.width/2
        
        removeCircles(for: newCircle)
        circlesArray.append(newCircle)
        
        self.view.addSubview(newCircle)
    }
    
    @IBAction func goToRoot(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    private func removeCircles(for newCircle: UIView){
        for circle in circlesArray{
            if newCircle.frame.intersects(circle.frame){
                circle.removeFromSuperview()
                circlesArray = circlesArray.filter({$0 != circle})
            }
        }
    }

}

