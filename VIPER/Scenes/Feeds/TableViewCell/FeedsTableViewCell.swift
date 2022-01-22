//
//  FeedsTableViewCell.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import UIKit
import Kingfisher

class FeedsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgFeed: UIImageView!
    @IBOutlet weak var nameFeeds: UILabel!
    @IBOutlet weak var dateFeeds: UILabel!
    @IBOutlet weak var autorFeeds: UILabel!
    @IBOutlet weak var HomeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        HomeView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor.white
        HomeView.static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.5))
        HomeView.layer.cornerRadius = 15.0
        imgFeed.layer.cornerRadius = 15.0
        imgFeed.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(news: Article) {
        imgFeed.kf.indicatorType = .activity
        nameFeeds.text = news.content
        dateFeeds.text = news.publishedAt
        autorFeeds.text = news.author
        if let img = URL(string: news.urlToImage ?? ""){
            DispatchQueue.main.async {
                self.imgFeed.kf.setImage(with: img)
            }
        }
        
    }
    
}
