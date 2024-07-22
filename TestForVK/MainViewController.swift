import UIKit

final class MainViewController: UIViewController {
    let namesWeather: [WeatherModel] = [
        WeatherModel(title: LocalizableString.sunny, type: .sunny),
        WeatherModel(title: LocalizableString.rainy, type: .rainy),
        WeatherModel(title: LocalizableString.windy, type: .windy),
        WeatherModel(title: LocalizableString.tornado, type: .tornado),
        WeatherModel(title: LocalizableString.foggy, type: .foggy),
        WeatherModel(title: LocalizableString.cloudly, type: .cloudly),
        WeatherModel(title: LocalizableString.thunder, type: .thunder),
        WeatherModel(title: LocalizableString.cold, type: .cold)
    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = CGFloat(10)
        let collectionView = UICollectionView(frame: .zero,
                                       collectionViewLayout: layout)
        return collectionView
    }()
    
    lazy var backgroundImage: UIImageView = {
       let imageView = UIImageView()
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.contentMode = .scaleAspectFill
       return imageView
   }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsRandomGif()
        settingsView()
        settingsCollectionView()
        settingsConstraints()
    }

    func settingsView() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(backgroundImage)
    }
    
    func settingsCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func animateBackgroundTransition(to newImage: UIImage) {
        backgroundImage.image = newImage
        UIView.animate(withDuration: TimeInterval(1), animations: {
            self.backgroundImage.alpha = CGFloat(1)
            self.backgroundImage.alpha = 0.5
        }, completion: { _ in
            self.backgroundImage.image = newImage
            self.backgroundImage.alpha = CGFloat(1)
            self.backgroundImage.alpha = 0.5
        })
    }
    
    func settingsGifs(gifName: String) {
        if let gifImage = UIImage.gifImage(name: gifName) {
            animateBackgroundTransition(to: gifImage)
        } else {
            return
        }
    }
    
    func settingsRandomGif() {
        let randomGifName = GifNames.elementsWeather.randomElement() ?? GifNames.sunny
        settingsGifs(gifName: randomGifName)
    }

    private func settingsConstraints() {
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
}
