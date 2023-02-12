//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Muayad Haddad on 12/02/2023.
//

import UIKit
import SDWebImageMapKit

class TitleTableViewCell: UITableViewCell {

    
    static let reuseID = "TitleTableViewCell"
    
    
    private let playTitleButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        
        return button
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
   private let titlePosterUIImageView : UIImageView = {
       let image = UIImageView()
       image.contentMode = .scaleAspectFill
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titlePosterUIImageView)
        addSubview(titleLabel)
        addSubview(playTitleButton)
        
        applyConstraints()
    }
    private func applyConstraints(){
        let titlePosterUIImageViewConst = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: topAnchor , constant: 15),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConst = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor ),
            titleLabel.widthAnchor.constraint(equalToConstant: (contentView.bounds.width)/2 )
            
        ]
        let playTitleButtonConst = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: centerYAnchor ),
            
        ]
        
        NSLayoutConstraint.activate(titlePosterUIImageViewConst)
        NSLayoutConstraint.activate(titleLabelConst)
        NSLayoutConstraint.activate(playTitleButtonConst)
    }
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        titlePosterUIImageView.sd_setImage(with: url)
        titleLabel.text = model.titleName
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
