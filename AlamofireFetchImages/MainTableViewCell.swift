import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImageView: UIImageView!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var artistCountry: UILabel!
    
    @IBOutlet weak var trackName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
