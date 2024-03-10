//
//  ViewController.swift
//  FeedPreview
//
//  Created by IPH Technologies Pvt. Ltd.
//

import UIKit

enum swipeDirection {
    case up
    case down
}

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var detailBackgroundView: UIView!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var tabBarBackgroundView: UIView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    
    //MARK: Constants
    var profileDataArray = [ProfileModel]()
    var currentlySelectedIndex = 0
    var currentCell:ProfileCollectionViewCell?
    var gradientLayer: CAGradientLayer?
    
    var currentlySelectedRow = 0
    
    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

//        addingDemoData()
        profileDataArray = HandleDefaultData.shared.getDefaultFeed()
        
//        photoArray = PhotosCollection.defaultPhotoList()
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        photoCollectionView.showsHorizontalScrollIndicator = false
        
        if let layout = profileCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: 393, height: 700)
        }
        if let layout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 00, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: photoCollectionView.frame.size.width / 3 + 10, height: photoCollectionView.frame.size.height)
        }
        
        //inhancing UI outlook
        setupUI()
        
        //adding upword swipe gesture
        addSwipeGesture(direction: .up)
        addSwipeGesture(direction: .down)
        
    }
    
    func addSwipeGesture(direction: swipeDirection) {
        switch direction {
        case .up:
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleUpSwipeGesture(_:)))
            swipeGesture.direction = .up
            view.addGestureRecognizer(swipeGesture)
        case .down:
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDownSwipeGesture(_:)))
            swipeGesture.direction = .down
            view.addGestureRecognizer(swipeGesture)
        }
        
    }
   
    //MARK: SetUpUIComponents
    func setupUI() {
        detailBackgroundView.layer.cornerRadius = cornerRadius
        //detailBackgroundView.addShadow(shadowColor: .black, shadowOpacity: 0.8)
        followButton.layer.cornerRadius = followButton.frame.size.height / 2
        
        followButton.backgroundColor = .clear
        followButton.layer.borderWidth = 3
        let color = UIColor(red: 211/255, green: 111/255, blue: 101/255, alpha: 1.0)
        followButton.layer.borderColor = color.cgColor
        followButton.tintColor = color
        followButton.titleLabel?.font =  UIFont(name: "", size: 20)
        
        tabBarBackgroundView.layer.cornerRadius = cornerRadius
        //tabBarBackgroundView.addShadow()
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        
        profileBtn.tintColor = .white
        profileBtn.backgroundColor =  UIColor(red: 211/255, green: 111/255, blue: 101/255, alpha: 1.0)
        profileBtn.layer.cornerRadius = profileBtn.frame.size.height / 2
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = followButton.bounds

        let startColor = UIColor.clear.cgColor
        let endColor = UIColor.clear.cgColor

        gradientLayer?.colors = [startColor, endColor]

        followButton.layer.addSublayer(gradientLayer!)
        
    }

    
    @objc func handleUpSwipeGesture(_ gestureRecognizer: UISwipeGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            let animationDuration: TimeInterval = 0.7 // Adjust the duration to your preference
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseOut], animations: { [self] in
                self.detailBackgroundView.frame.origin.y = self.detailBackgroundView.frame.size.height - 30
                self.currentCell?.postDetailsBackView.frame.origin.y = self.detailBackgroundView.frame.origin.y - 75
            }, completion: nil)
        }
    }
    
    
    
    func circleAnimation(_ view: UIButton, duration: CFTimeInterval) {
        let maskDiameter = CGFloat(sqrtf(powf(Float(followButton.bounds.width), 2) + powf(Float(view.bounds.height), 2)))
        let mask = CAShapeLayer()
        let animationId = "path"

        // Make a circular shape.
       mask.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: maskDiameter, height: maskDiameter), cornerRadius: maskDiameter / 2).cgPath

        // Center the shape in the view.
        mask.position = CGPoint(x: (followButton.bounds.width + maskDiameter) / 20, y: (followButton.bounds.height - maskDiameter) / 2)

        // Fill the circle.
    //    mask.fillColor = UIColor.black.cgColor

        // Add as a mask to the parent layer.
        followButton.layer.mask = mask

        // Animate.
        let animation = CABasicAnimation(keyPath: animationId)
        animation.duration = duration
        animation.fillMode = .backwards
        animation.isRemovedOnCompletion = true

        // Create a new path.
        let newPath = UIBezierPath(roundedRect: CGRect(x: maskDiameter, y: maskDiameter / 2, width: 0, height: 0), cornerRadius: 0).cgPath

        // Set start and end values.
        animation.fromValue = mask.path
        animation.toValue = newPath

        // Start the animation.
        mask.add(animation, forKey: animationId)
    }
    
    @IBAction func didTapFollowBtn(_ sender: UIButton) {
        
        
        profileDataArray[currentlySelectedIndex].isFollowed = true
    
        UIView.animate(withDuration: 0.3, animations: {

            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [0, 0, 0.25]
            animation.toValue = [0.75, 1, 1]
            animation.duration = 2
            animation.repeatCount = .infinity

            self.gradientLayer?.add(animation, forKey: nil)
            self.followButton.alpha = 0.0
                }) { _ in
                    // When the animation is complete
                    self.profileBtn.isHidden = false
                }
        circleAnimation(followButton, duration: 1.0)
        
        
    }
    
    @objc func handleDownSwipeGesture(_ gestureRecognizer: UISwipeGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            let animationDuration: TimeInterval = 0.7 // Adjust the duration to your preference

            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseOut], animations: { [self] in
                detailBackgroundView.frame.origin.y =  1.5 * self.self.detailBackgroundView.frame.size.height
                currentCell?.postDetailsBackView.frame.origin.y = detailBackgroundView.frame.origin.y - 75
            }, completion: nil)
        }
    }
    

}

//MARK: Extension
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == profileCollectionView {
            return profileDataArray.count
        }
        else {
            return profileDataArray[self.currentlySelectedRow].photos.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == profileCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = profileDataArray[indexPath.row]
            cell.profileImageView?.image = UIImage(named: data.profilePic)
            cell.profileImageView.contentMode = .scaleToFill
            cell.crossButton.tintColor = UIColor.white
            cell.personButton.tintColor = UIColor.white
            cell.postCountLbl.text = String(data.posts)
            cell.followersCountLbl.text = String(data.followers)
            cell.followingCountLbl.text = String(data.followings)
            titleLabel.text = data.title
            addressLabel.text = data.address
      //      descLbl.text = data.description
            
            
            cell.postDetailsBackView.fadeOutToTop()
            cell.postDetailsBackView.fadeInFromBottom()
            addressLabel.fadeOutToTop()
            addressLabel.fadeInFromBottom()
            titleLabel.fadeOutToTop()
            titleLabel.fadeInFromBottom()
            
            currentCell = cell as? ProfileCollectionViewCell
            return cell
        }
        else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.photoImageView.image = UIImage(named: profileDataArray[currentlySelectedRow].photos[indexPath.row])
     //       cell.photoImageView.image = UIImage(named:image)
            cell.photoImageView.contentMode = .center
            cell.photoImageView.layer.cornerRadius = 10
           // cell.photoImageView.addShadow()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let row = indexPath.row
        
        print("row data; \(row)")
        self.currentlySelectedRow = row
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == profileCollectionView {
            currentlySelectedIndex = indexPath.row
        }
    }

}

