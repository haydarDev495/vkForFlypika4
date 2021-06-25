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

}

class NewsFeedCell: UITableViewCell {
    

    
    @IBOutlet weak var IconImageViewTopView: UIImageView!
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
    }
    func set(viewModel: FeedCellViewModel) {
        nameLabelTopView.text = viewModel.name
        dateLabelTopView.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabelBottomView.text = viewModel.likes
        commentsLabelBottomView.text = viewModel.comments
        shareLabelBottomView.text = viewModel.shares
        viewsLabelBottomView.text = viewModel.views
    }
}
