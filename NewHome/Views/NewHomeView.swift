import UIKit
import SnapKit

class NewHomeView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewHomeTableViewCell.self, forCellReuseIdentifier: NewHomeTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configContraints()
    }
    
    public func configTableViewProtocol(delegate:UITableViewDelegate, dataSouse: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSouse
    }

     func addSubView() {
           addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContraints() {

       self.tableView.snp.makeConstraints { make in
           make.top.equalToSuperview()
           make.left.equalToSuperview()
           make.right.equalToSuperview()
           make.bottom.equalToSuperview()
       }
    }
}
