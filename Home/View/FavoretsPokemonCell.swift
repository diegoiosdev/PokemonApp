import UIKit
import SnapKit

class FavoretsPokemonCell: UIView {

    lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .green
        collectionView.delaysContentTouches = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
       return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configContraints()
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(collectionView)
    }
    
    func configContraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
        ])
    }
    
    func configContraintsCollectionView() {
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
