//
//  DailyTableViewCell.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 21.01.2022.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var hightTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    static var identifier = "DailyTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyTableViewCell",
                     bundle: nil)
    }
    
    func configureCell(viewModel: DailyTableViewCellViewModel) {
        dayLabel.text = viewModel.dayString
        humidityLabel.text = viewModel.humidityString
        hightTempLabel.text = viewModel.hightTempString
        lowTempLabel.text = viewModel.lowTempString
    }
    
}
