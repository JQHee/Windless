//
//  WindlessTableViewCell.swift
//  WindlessDemo
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class WindlessTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    
    func setupContent<T>(model: T) where T: WindlessViewModel {
        updateContenView(isWindless: model.isWindless)
        isUserInteractionEnabled = !model.isWindless
        guard !model.isWindless else {
            return
        }
        // TODO: 根据数据更新视图。。。
    }

    func updateContenView(isWindless: Bool) {
        labelName.text = ""
        labelDetail.text = ""
        labelName.windless(isWindless: isWindless)
        labelDetail.windless(isWindless: isWindless)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
