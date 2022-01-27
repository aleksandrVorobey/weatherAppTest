//
//  HourlyCollectionViewCell.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 27.01.2022.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    static var identifier = "HourlyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell",
                     bundle: nil)
    }
    
    func configureHourlyCell(viewModel: HourlyCollectionCellViewModel) {
        timeLabel.text = viewModel.timeString
        humidityLabel.text = viewModel.humidityString
        tempLabel.text = viewModel.tempString
    }

}
