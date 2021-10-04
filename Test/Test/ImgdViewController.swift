//
//  ImgdViewController.swift
//  Test
//
//  Created by Jijo on 04/10/21.
//

import UIKit

class ImgdViewController: UIViewController {

    @IBOutlet weak var setImage: UIImageView!
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage.image = image
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
