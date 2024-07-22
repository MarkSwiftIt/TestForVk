import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedButton = namesWeather[indexPath.item]
        
        switch selectedButton.type {
        case WeatherModel.WeatherType.sunny:
            settingsGifs(gifName: GifNames.sunny)
        case WeatherModel.WeatherType.rainy:
            settingsGifs(gifName: GifNames.rainy)
        case WeatherModel.WeatherType.windy:
            settingsGifs(gifName: GifNames.windy)
        case WeatherModel.WeatherType.tornado:
            settingsGifs(gifName: GifNames.tornado)
        case WeatherModel.WeatherType.foggy:
            settingsGifs(gifName: GifNames.foggy)
        case WeatherModel.WeatherType.cloudly:
            settingsGifs(gifName: GifNames.cloudly)
        case WeatherModel.WeatherType.thunder:
            settingsGifs(gifName: GifNames.thunder)
        case WeatherModel.WeatherType.cold:
            settingsGifs(gifName: GifNames.cold)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 50)
    }
}
