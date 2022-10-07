import UIKit

class BagasTableViewCell: UITableViewCell {

    static let identifier:String = "BagasTableViewCell"
    
    lazy var bagaImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var bagas: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 45)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(bagaImageView)
        self.contentView.addSubview(bagas)
    }
    
    public func setUpCell(data: ModelTest){
        self.bagas.text = data.name
        self.bagaImageView.image = UIImage(named: data.nameImage)
    }
        
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.bagaImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.bagaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bagaImageView.heightAnchor.constraint(equalToConstant: 100),
            self.bagaImageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.bagas.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.bagas.leadingAnchor.constraint(equalTo: self.bagaImageView.trailingAnchor, constant: 20),
        ])
    }
}
