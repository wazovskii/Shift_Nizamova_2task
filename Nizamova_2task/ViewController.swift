import SnapKit
import UIKit


let weather:String="Sunny ☀️ 26º"
let traffic:String = "Traffic jams🚦 9"
let policyUsd:String = "USD 💵  73,89"
let policyEur:String = "EURO 💶  88,88"
let policyOil:String = "Oil 🛢 63,74"

let screenBounds = UIScreen.main.bounds
let widthDevice = screenBounds.width

func viewsMultiply(upperView: UIView, backgroundView: UIView, top: float_t, left: float_t, right: float_t, height: Int)->UIView{
    let view = UIView()
    view.backgroundColor = .systemGray3
    backgroundView.addSubview(view)
    view.snp.makeConstraints { (make) in
        make.top.equalTo(upperView.snp.bottom).offset(top)
        make.left.equalToSuperview().offset(left)
        make.right.equalToSuperview().offset(right)
        make.height.equalTo(height)
    }
    return view;
}

func makeHeader( backgroundView: UIView, top: float_t, left: float_t, right: float_t, height: Int)->UIView{
    let header = UILabel()
           header.textAlignment = NSTextAlignment.center;
           header.text = "Lenta.ru"
           header.font = UIFont(name: "Helvetica", size: 30.0)
           backgroundView.addSubview(header)
    header.snp.makeConstraints { (make) in
        make.left.equalToSuperview().offset(left)
        make.right.equalToSuperview().offset(right)
        make.top.equalToSuperview().offset(top)
        make.height.equalTo(height)
    }
    return header
    
}

func addTextContents(backgroundView:UIView, top: Int, left: Int, right: Int, height:Int,content:String)->UILabel{
    let textContent = UILabel()
    textContent.text = content
    textContent.font = UIFont(name: "Helvetica", size: 30.0)
    textContent.lineBreakMode = .byWordWrapping
    textContent.numberOfLines = 0
    backgroundView.addSubview(textContent)
    textContent.snp.makeConstraints { (make) in
        make.left.equalToSuperview().offset(left)
        make.right.equalToSuperview().offset(right)
        make.top.equalToSuperview().offset(top)
        make.height.equalTo(height)
    }
    return textContent
}

func initializeBottomView(backgroundView: UIView, penultimateView: UIView)->UIView{
    let bottomView = UIView()
    bottomView.backgroundColor = .systemGray3
    backgroundView.addSubview(bottomView)
    bottomView.snp.makeConstraints { (make) in
        make.top.equalTo(penultimateView.snp.bottom).offset(20.0)
        make.left.equalToSuperview().offset(20.0)
        make.right.equalToSuperview().offset(-20.0)
        make.height.equalTo(100)
        make.bottom.equalToSuperview().offset(-20.0)
    }
    return bottomView
}

func initializeTopView(backgroundView: UIView, header:UIView)->UIView{
    let topView = UIView()
    topView.backgroundColor = .lightGray
    backgroundView.addSubview(topView)
    topView.snp.makeConstraints { (make) in
        make.top.equalTo(header.snp.bottom).offset(20)
        make.left.equalToSuperview().offset(20.0)
        make.right.equalToSuperview().offset(-20.0)
        make.height.equalTo(50)
    }
    return topView
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addScrollView()
    }
    @objc func buttonAction(sender: UIButton!) {
      let rootVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC,animated: true)
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    private func addScrollView()
    {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.bottom.top.left.right.equalToSuperview()
        }

        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightGray
        scrollView.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.bottom.top.left.right.equalToSuperview()
            make.width.equalTo(self.view.bounds.width)
        }

        let header = makeHeader(backgroundView: backgroundView, top: 300, left: 20, right: -20, height: 100)
        let topView:UIView = initializeTopView(backgroundView: backgroundView, header: header)
        
        
        let secondViewControllerButton = UIButton()
        secondViewControllerButton.frame = CGRect(x: round(widthDevice/2)-95, y: 0, width: 150, height: 50)
        secondViewControllerButton.backgroundColor = UIColor.darkGray
        secondViewControllerButton.setTitle("Read news", for: .normal)
        secondViewControllerButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        topView.addSubview(secondViewControllerButton)


        let view2 = viewsMultiply(upperView: topView, backgroundView: backgroundView, top: 100.0, left: 20.0, right: -20.0, height: 100)
        let view3 = viewsMultiply(upperView: view2, backgroundView: backgroundView, top: 20.0, left: 20.0, right: -20.0, height: 100)
        let view4 = viewsMultiply(upperView: view3, backgroundView: backgroundView, top: 20.0, left: 20.0, right: -20.0, height: 100)
        let view5 = viewsMultiply(upperView: view4, backgroundView: backgroundView, top: 20.0, left: 20.0, right: -20.0, height: 100)
        let bottomView:UIView = initializeBottomView(backgroundView: backgroundView, penultimateView: view5)
        
        
        _ = addTextContents(backgroundView: view2, top: 10, left: 100, right: 0, height: 60, content: weather)
        _ = addTextContents(backgroundView: view3, top: 10, left: 80, right: 0, height: 60, content: traffic)
        _ = addTextContents(backgroundView: view4, top: 10, left: 90, right: 0, height: 60, content: policyEur)
        _ = addTextContents(backgroundView: view5, top: 10, left: 90, right: 0, height: 60, content: policyUsd)
        _ = addTextContents(backgroundView: bottomView, top: 10, left: 90, right: 0, height: 60, content: policyOil)
    }

}

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
        private var tableView: UITableView!
        private var data: ModelRow?
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
            if let data = self.data
            {
                cell.textLabel?.text = data.title
                cell.detailTextLabel?.text = data.subtitle
            }
            cell.backgroundColor = .gray
            return cell
        }
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.addTableView()
            self.setDataModel()
        }
    
        private func addTableView()
        {
            self.tableView = UITableView()
            self.tableView?.delegate = self
            self.tableView?.dataSource = self
            self.view.addSubview(self.tableView)
            self.tableView.snp.makeConstraints { (make) in
                make.left.right.bottom.top.equalToSuperview()
            }
        }
    
        private func setDataModel()
        {
            let service = DataService()
            let data = service.getData()
            self.data = data
        }
}
