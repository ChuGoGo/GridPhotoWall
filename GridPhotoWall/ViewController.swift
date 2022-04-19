//
//  ViewController.swift
//  GridPhotoWall
//
//  Created by Chu Go-Go on 2022/4/17.
//

import UIKit

class ViewController: UIViewController {
//    儲存標題
   var photoTitle = ""
//    儲存照片
    var images = ""
//    儲存照片Array
    var imageArray: [String] = []
//    設定四個相簿，以及他們的照片
    var photos = [Love(name: "淡水的點點滴滴", image: "Tamsui"),
                  Love(name: "日常的點點滴滴", image: "life"),
                  Love(name: "台灣趴趴走", image: "trip"),
                  Love(name: "宿霧甜蜜蜜", image: "Cebu")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    到下一頁
    @IBAction func nextButton(_ sender: UIButton) {
//        照片名稱 = photos[Button相對應的tag]的名稱
        photoTitle = photos[sender.tag].name
//        照片 = photos[Button相對應的tag]的名稱
        images = photos[sender.tag].image
//        跑出陣列的相片名稱
        showImage(image: images)
//        把資料傳送到SegueActionID為showPhoto的Func裡
        performSegue(withIdentifier: "showPhoto", sender: nil)
//        把Array清空
        imageArray.removeAll()
    }
//    顯示全部圖片
    @IBAction func showAllImage(_ sender: UIButton) {
//        相簿名稱
        photoTitle = "所有相片"
//        跑出所有照片的陣列
        showAllImage()
//        把資料傳送到SegueActionID為showPhoto的Func裡
        performSegue(withIdentifier: "showPhoto", sender: nil)
//     把Array清空
        imageArray.removeAll()
    }
//    到下一頁顯示圖片
    @IBSegueAction func showPhoto(_ coder: NSCoder) -> PhotoCollectionViewController? {
//        將資料傳到下一頁
        return PhotoCollectionViewController(coder: coder, photoTitle: photoTitle, imageArray: imageArray)
    }
//    叫出圖片儲存到[String]
    func showImage(image: String){
//        跑1-10把名稱後面加入編號
            for i in 1...10{
//                image就會變成 名稱1...10
                let image = "\(image)\(i)"
//                print(image)
//                儲存到imageArray裡
                imageArray.append(image)
            }
    }
// 顯示全部的照片
    func showAllImage(){
//        跑 photos的每一個主題
        for photo in photos {
//            在跑每張照片1...10的編號
            for i in 1...10{
                let image = "\(photo.image)\(i)"
//                print(image)
//                儲存到Array裡
                imageArray.append(image)
            }
        }
    }
    
//
//    func getall() {
//        let image_Cebu = Bundle.main.url(forResource: "Cebu1", withExtension: nil)
//
//        print(image_Cebu)
//    }
}

