//
//  DetailViewController.swift
//  GridPhotoWall
//
//  Created by Chu Go-Go on 2022/4/18.
//

import UIKit

class DetailViewController: UIViewController {
//    顯示得圖片
    var image: UIImage
    @IBOutlet weak var imageView: UIImageView!
//收到的值有coder: NSCoder跟 image: UIImage
     init?(coder: NSCoder,image: UIImage) {
        self.image = image
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("not code found")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        設定圖片比例
        imageView.contentMode = .scaleAspectFit
        //    顯示圖片
        imageView.image = image
    
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
