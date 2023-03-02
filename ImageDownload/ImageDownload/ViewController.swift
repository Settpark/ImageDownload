import UIKit

class ViewController: UIViewController {

    private var firstImageView: UIImageView
    private var secondImageView: UIImageView
    private var thirdImageView: UIImageView
    private var fourthImageView: UIImageView
    private var fifthImageView: UIImageView
    
    private var firstButton: UIButton
    private var secondButton: UIButton
    private var thirdButton: UIButton
    private var fourthButton: UIButton
    private var fifthButton: UIButton
    
    private let imageDownloadService: Service
    private let defaultImage: UIImage
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        firstImageView = UIImageView(image: UIImage(systemName: "photo"))
        secondImageView = UIImageView(image: UIImage(systemName: "photo"))
        thirdImageView = UIImageView(image: UIImage(systemName: "photo"))
        fourthImageView = UIImageView(image: UIImage(systemName: "photo"))
        fifthImageView = UIImageView(image: UIImage(systemName: "photo"))
        
        firstButton = UIButton()
        secondButton = UIButton()
        thirdButton = UIButton()
        fourthButton = UIButton()
        fifthButton = UIButton()
        
        imageDownloadService = Service()
        defaultImage = UIImage(systemName: "photo") ?? UIImage()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    @objc func requestAllImage(sender: UIButton) {
        let queue: DispatchQueue = DispatchQueue(label: "imageDispatchQueue", qos: .background, attributes: .concurrent)
        queue.async { [weak self] in
            self?.requestFirstImage(sender: self?.firstButton ?? UIButton())
            self?.requestSecondImage(sender: self?.secondButton ?? UIButton())
            self?.requestThirdImage(sender: self?.thirdButton ?? UIButton())
            self?.requestFourthImage(sender: self?.fourthButton ?? UIButton())
            self?.requestFifthImage(sender: self?.fifthButton ?? UIButton())
        }
    }
    
    @objc func requestFirstImage(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.firstImageView.image = self?.defaultImage
        }
        imageDownloadService.downloadImage(url: ImageURL.firstURL.rawValue) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.firstImageView.image = UIImage(data: data) ?? self?.defaultImage
                }
            case .failure(_):
                break
            }
        }
    }
    
    @objc func requestSecondImage(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.secondImageView.image = self?.defaultImage
        }
        imageDownloadService.downloadImage(url: ImageURL.secondURL.rawValue) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.secondImageView.image = UIImage(data: data) ?? self?.defaultImage
                }
            case .failure(_):
                break
            }
        }
    }
    
    @objc func requestThirdImage(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.thirdImageView.image = self?.defaultImage
        }
        imageDownloadService.downloadImage(url: ImageURL.thirdURL.rawValue) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.thirdImageView.image = UIImage(data: data) ?? self?.defaultImage
                }
            case .failure(_):
                break
            }
        }
    }
    
    @objc func requestFourthImage(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.fourthImageView.image = self?.defaultImage
        }
        imageDownloadService.downloadImage(url: ImageURL.fourthURL.rawValue) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.fourthImageView.image = UIImage(data: data) ?? self?.defaultImage
                }
            case .failure(_):
                break
            }
        }
    }
    
    @objc func requestFifthImage(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.fifthImageView.image = self?.defaultImage
        }
        imageDownloadService.downloadImage(url: ImageURL.fifthURL.rawValue) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.fifthImageView.image = UIImage(data: data) ?? self?.defaultImage
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func initView() {
        let defaultImageWidth: CGFloat = 120
        let defaultImageHeight: CGFloat = 100
        let imageSpace: CGFloat = 30
        
        view.backgroundColor = .white
        
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
        view.addSubview(fourthImageView)
        view.addSubview(fifthImageView)
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        view.addSubview(fifthButton)
        
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: imageSpace).isActive = true
        firstImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        firstImageView.widthAnchor.constraint(equalToConstant: defaultImageWidth).isActive = true
        firstImageView.heightAnchor.constraint(equalToConstant: defaultImageHeight).isActive = true
        
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: imageSpace).isActive = true
        secondImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        secondImageView.widthAnchor.constraint(equalToConstant: defaultImageWidth).isActive = true
        secondImageView.heightAnchor.constraint(equalToConstant: defaultImageHeight).isActive = true
        
        thirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdImageView.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: imageSpace).isActive = true
        thirdImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        thirdImageView.widthAnchor.constraint(equalToConstant: defaultImageWidth).isActive = true
        thirdImageView.heightAnchor.constraint(equalToConstant: defaultImageHeight).isActive = true
        
        fourthImageView.translatesAutoresizingMaskIntoConstraints = false
        fourthImageView.topAnchor.constraint(equalTo: thirdImageView.bottomAnchor, constant: imageSpace).isActive = true
        fourthImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        fourthImageView.widthAnchor.constraint(equalToConstant: defaultImageWidth).isActive = true
        fourthImageView.heightAnchor.constraint(equalToConstant: defaultImageHeight).isActive = true
        
        fifthImageView.translatesAutoresizingMaskIntoConstraints = false
        fifthImageView.topAnchor.constraint(equalTo: fourthImageView.bottomAnchor, constant: imageSpace).isActive = true
        fifthImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        fifthImageView.widthAnchor.constraint(equalToConstant: defaultImageWidth).isActive = true
        fifthImageView.heightAnchor.constraint(equalToConstant: defaultImageHeight).isActive = true
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        firstButton.centerYAnchor.constraint(equalTo: firstImageView.centerYAnchor).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        firstButton.backgroundColor = .blue
        firstButton.setTitle("Load", for: .normal)
        firstButton.layer.cornerRadius = 10
        firstButton.addTarget(self, action: #selector(requestFirstImage(sender: )), for: .touchUpInside)
        
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        secondButton.centerYAnchor.constraint(equalTo: secondImageView.centerYAnchor).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        secondButton.backgroundColor = .blue
        secondButton.setTitle("Load", for: .normal)
        secondButton.layer.cornerRadius = 10
        secondButton.addTarget(self, action: #selector(requestSecondImage(sender: )), for: .touchUpInside)
        
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        thirdButton.centerYAnchor.constraint(equalTo: thirdImageView.centerYAnchor).isActive = true
        thirdButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        thirdButton.backgroundColor = .blue
        thirdButton.setTitle("Load", for: .normal)
        thirdButton.layer.cornerRadius = 10
        thirdButton.addTarget(self, action: #selector(requestThirdImage(sender: )), for: .touchUpInside)
        
        fourthButton.translatesAutoresizingMaskIntoConstraints = false
        fourthButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        fourthButton.centerYAnchor.constraint(equalTo: fourthImageView.centerYAnchor).isActive = true
        fourthButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        fourthButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        fourthButton.backgroundColor = .blue
        fourthButton.setTitle("Load", for: .normal)
        fourthButton.layer.cornerRadius = 10
        fourthButton.addTarget(self, action: #selector(requestFourthImage(sender: )), for: .touchUpInside)
        
        fifthButton.translatesAutoresizingMaskIntoConstraints = false
        fifthButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        fifthButton.centerYAnchor.constraint(equalTo: fifthImageView.centerYAnchor).isActive = true
        fifthButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        fifthButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        fifthButton.backgroundColor = .blue
        fifthButton.setTitle("Load", for: .normal)
        fifthButton.layer.cornerRadius = 10
        fifthButton.addTarget(self, action: #selector(requestFifthImage(sender: )), for: .touchUpInside)
        
        let allRequestButton: UIButton = UIButton()
        view.addSubview(allRequestButton)
        allRequestButton.translatesAutoresizingMaskIntoConstraints = false
        allRequestButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        allRequestButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
        allRequestButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        allRequestButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        allRequestButton.backgroundColor = .blue
        allRequestButton.layer.cornerRadius = 10
        allRequestButton.addTarget(self, action: #selector(requestAllImage(sender: )), for: .touchUpInside)
        allRequestButton.setTitle("Load All Images", for: .normal)
    }
}

