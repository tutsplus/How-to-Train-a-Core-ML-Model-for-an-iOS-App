//
//  ViewController.swift
//  LasVegasHotelReviews
//
//  Created by Doron Katz on 12/8/17.
//  Copyright © 2017 Doron Katz. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    let reviews = Vegas_Reviews()
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var nrReviews: UISlider!
    @IBOutlet weak var nrHotelReviews: UISlider!
    @IBOutlet weak var stars: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.makePrediction(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makePrediction(_ sender: Any){
        let nrReviewsSelected = Double(nrReviews.value)
        let nrHotelReviewsSelected = Double(nrHotelReviews.value)
        
        var starsSelected: Double{
            switch stars.selectedSegmentIndex {
            case 0:
                return 3.0
            case 1:
                return 4.0
            case 2:
                return 5.0
            default:
                return 5.0
            }
        }
        
        if let predictions = try? self.reviews.prediction(Nr__reviews: nrReviewsSelected, Nr__hotel_reviews: nrHotelReviewsSelected, Hotel_stars: starsSelected){

            let scoreFormatter = NumberFormatter()
            scoreFormatter.numberStyle = .decimal
            scoreFormatter.maximumFractionDigits = 1
            self.scoreValue.text = scoreFormatter.string(for: predictions.Score)

        }else{
            print("Error")
        }
        
        
        
    }


}


