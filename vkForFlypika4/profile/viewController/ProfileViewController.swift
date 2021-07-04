//
//  ProfileViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 22.06.21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // session
    private let session = URLSession.shared
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var buttonCity: UIButton!
    @IBOutlet weak var friendsLabelCount: UILabel!
    @IBOutlet weak var friendsCount: UILabel!
    
    
    var myArray = ["1","2","3","1","2","3","1","2","3","1","2","3","1","2","3","1","2","3","1","2","3","1","2","3","1","2","3","1","2","3"]
    var myArrayName = ["Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar","Хайдар","Haydar"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        configure()
        
        
    }
    @IBAction func MoreInformationButtonAction(_ sender: Any) {
        let newVC = UIStoryboard(name: "Info", bundle: nil).instantiateInitialViewController() as! InfoViewController
//        newVC.modalTransitionStyle = .flipHorizontal
        
        newVC.modalPresentationStyle = .formSheet
        self.present(newVC, animated: true, completion: nil)
        
    }
}

private extension ProfileViewController {
    func configure() {
        getProfileFromServer()
        getProfileFromServerForFriends()
    }
    func getProfileFromServer() {
        guard let url = URL(string:"https://api.vk.com/method/account.getProfileInfo?v=5.131&access_token=502f3bbe76cc153fc888ab27f2603de90cce5988c24a6ca72b2a8e571c34964c83ff988cf95c59481d0f8")
        else {
            return print("error")
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let profile = try? JSONDecoder().decode(ProfileData.self, from: data) {
                    DispatchQueue.main.async {
                        
                        self.nameLabel.text = profile.response.first_name + " " +  profile.response.last_name
                        self.buttonCity.setTitle("  Город: \(profile.response.city.title)", for: .normal)
                        print(profile.response.home_town)
                        print(profile.response.city.title)
                    }
                }
            }
        }
        task.resume()
    }
    func getProfileFromServerForFriends() {
        guard let url = URL(string:"https://api.vk.com/method/friends.get?count&access_token=bf1ddef97e24242a5e97a5ba4bdb401cce0d967ac56695ccd3a6a59b644e0f64452c458262d181afff8c7&v=5.131")
        else {
            return print("error")
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let profile = try? JSONDecoder().decode(ProfileDataFriends.self, from: data) {
                    DispatchQueue.main.async {
                        self.friendsCount.text = "\(profile.response.count)"
                    }
                }
            }
        }
        task.resume()
    }
}

//ProfileDataFriends

// Mark
// Mark : Collection view Delegate
extension ProfileViewController : UICollectionViewDelegate {
    
    
}

// Mark
// Mark : Collection view data source
extension ProfileViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ProfileCollectionViewCell
        cell.imageCellCollection.image = UIImage(named: myArray[indexPath.row])
        cell.labelCollection.text = myArrayName[indexPath.row]
        return cell
    }
}
