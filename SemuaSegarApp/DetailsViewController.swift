//
//  DetailsViewController.swift
//  SemuaSegarApp
//
//  Created by prk on 08/02/23.
//

import UIKit

class DetailsViewController: UIViewController {

    var buah:Buah!
    var nutrition = [Nutritions] ()
    
    @IBOutlet weak var namaTxt: UILabel!
    @IBOutlet weak var genusTxt: UILabel!
    @IBOutlet weak var famTxt: UILabel!
    @IBOutlet weak var carbo: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var sugar: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaTxt.text = self.buah.name
        genusTxt.text = self.buah.genus
        famTxt.text = self.buah.family
        carbo.text = "\(buah.nutritions.carbohydrates)"
        protein.text = "\(buah.nutritions.protein)"
        fat.text = "\(buah.nutritions.fat)"
        calories.text = "\(buah.nutritions.calories)"
        sugar.text = "\(buah.nutritions.sugar)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
