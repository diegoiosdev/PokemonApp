import UIKit
import SnapKit

class NewHomeTableViewCell: UITableViewCell {

    static let identifier:String = "NewHomeTableViewCell"
    
    lazy var imagePokemon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configContraintsTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func addSubview() {
         contentView.addSubview(imagePokemon)
         contentView.addSubview(name)
    }
    
    func configContraintsTableView() {
        
        self.imagePokemon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(255)
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        self.name.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(150)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(25)
        }
    }
}
