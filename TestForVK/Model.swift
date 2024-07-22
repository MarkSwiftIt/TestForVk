import Foundation

struct WeatherModel {
    let title: String
    let type: WeatherType
    
    enum WeatherType: Int {
        case sunny
        case rainy
        case windy
        case tornado
        case foggy
        case cloudly
        case thunder
        case cold
        
    }
}
