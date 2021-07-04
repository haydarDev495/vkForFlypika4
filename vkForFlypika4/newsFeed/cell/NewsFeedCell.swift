//
//  NewsFeedCell.swift
//  vkForFlypika4
//
//  Created by Аида on 24.06.21.
//

import Foundation
import UIKit

protocol FeedCellViewModel {
    
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
    var photoAttachement : FeedCellPhotoAttachmentViewModel? {get}
    var sizes: FeedCellSizes { get }


}
protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomViewFrame: CGRect { get }
    var totalHeight: CGFloat { get }
    
}

protocol FeedCellPhotoAttachmentViewModel {
    var photoUrlString: String? {get}
    var widht : Int {get}
    var height : Int {get}
}

class NewsFeedCell: UITableViewCell {
    

    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var postImageView: WebImageView!
    @IBOutlet weak var IconImageViewTopView: WebImageView!
    @IBOutlet weak var nameLabelTopView: UILabel!
    @IBOutlet weak var dateLabelTopView: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likesLabelBottomView: UILabel!
    @IBOutlet weak var commentsLabelBottomView: UILabel!
    @IBOutlet weak var shareLabelBottomView: UILabel!
    @IBOutlet weak var viewsLabelBottomView: UILabel!
    
    static let reuseId = "NewsFeedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        IconImageViewTopView.layer.cornerRadius = 17.5
//        IconImageViewTopView.clipsToBounds = true
        
//        cardView.layer.cornerRadius = 10
//        cardView.clipsToBounds = true
        
        IconImageViewTopView.layer.cornerRadius = IconImageViewTopView.frame.width / 2
        IconImageViewTopView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        

        backgroundColor = .clear
        selectionStyle = .none
    }
    func set(viewModel: FeedCellViewModel) {
        
        IconImageViewTopView.set(imageURL: viewModel.iconUrlString)
        nameLabelTopView.text = viewModel.name
        dateLabelTopView.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabelBottomView.text = viewModel.likes
        commentsLabelBottomView.text = viewModel.comments
        shareLabelBottomView.text = viewModel.shares
        viewsLabelBottomView.text = viewModel.views
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        if let photoAttachment = viewModel.photoAttachement {
            postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }    }
}
