//
//  PhotoCollectionViewController.swift
//  GridPhotoWall
//
//  Created by Chu Go-Go on 2022/4/17.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
//    傳遞的 photoTitle
    var photoTitle = ""
//    傳遞的圖片名稱
    var imagesArray: [String] = []
//   顯示圖片的allImage
    var allImage: [UIImage] = []
//    定義接收的內容以及接收到的型態
    init?(coder: NSCoder, photoTitle: String, imageArray: [String]) {
//        標題
        self.photoTitle = photoTitle
//        圖片名稱
        self.imagesArray = imageArray
//         coder
        super.init(coder: coder)
    }
//      保護程式閃退
    required init?(coder: NSCoder) {
        fatalError("there isn not code")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCellSize()
        self.title = photoTitle
        print(photoTitle)
        getPhoto()
        print(PhotoCollectionViewController.self)
    }
// 跑出幾個Sections
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//跑出幾個collectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//       allImage的數量
        return allImage.count
    }
//    顯示的圖片
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        顯示的圖片在cell裡
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCollectionViewCell.self)", for: indexPath) as! PhotoCollectionViewCell
//        cell顯示的圖片=allImage裡面的圖片
        cell.photoImageView.image = allImage[indexPath.row]
//        回傳到cell
        return cell
    }
//    顯示大圖
    @IBSegueAction func showDetail(_ coder: NSCoder) -> DetailViewController? {
//        把選擇的圖片儲存成indexPath
        guard let indexPath = collectionView.indexPathsForSelectedItems else {return
//            如果沒有值就顯示UIImage()
            DetailViewController(coder: coder, image: UIImage())
        }
//        選擇的第一個
        let index = indexPath[0]
//        選擇的照片=第一個
        let selectImage = allImage[index.item]
//        傳到下一頁
            return DetailViewController(coder: coder, image: selectImage)
    }
//    設定一張圖片的大小
  func configureCellSize() {
//      每張圖的間隔
      let itemSpace: Double = 3
//      一排有幾張
        let columnCount: Double = 2
//      設定collectionView的Layout
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
//      寬度會是 銀幕寬度 - ((間隔*幾張圖片-1)/幾張圖片)
        let width = floor((collectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
//      設定每張圖的大小因爲是1:1所以都一樣
        flowLayout?.itemSize = CGSize(width: width, height: width)
//
        flowLayout?.estimatedItemSize = .zero
//      最小左右的間隔
        flowLayout?.minimumInteritemSpacing = itemSpace
//         最小的上下間隔
        flowLayout?.minimumLineSpacing = itemSpace
    }
//    取出每張照片的名稱回傳承[images]
    func getPhoto(){
        for i in imagesArray{
            if let images = UIImage(named: i){
                allImage += [images]
            }
        }
    }


//    func getSelectPhoto(number: IndexPath)-> UIImage{
//
//    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
