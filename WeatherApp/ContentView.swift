//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vivek Shrivastava on 14/07/24.
//

import SwiftUI

struct WeatherDay {
    let dayOfWeek: String
    let weatherImage: String
    let temp: Int
}


struct ContentView: View {
    
    @State private var isNight: Bool = false
    let weeklyWeather: [WeatherDay] = [
           WeatherDay(dayOfWeek: "WED", weatherImage: "cloud.sun.fill", temp: 22),
           WeatherDay(dayOfWeek: "THU", weatherImage: "sun.max.fill", temp: 20),
           WeatherDay(dayOfWeek: "FRI", weatherImage: "wind.snow", temp: 25),
           WeatherDay(dayOfWeek: "SAT", weatherImage: "sunset.fill", temp: 18),
           WeatherDay(dayOfWeek: "SUN", weatherImage: "snow", temp: 21)
        ]
    
    var body: some View {
        
        ZStack {
            BackgroundGradientView(topColor: isNight ? .black : Color("lightBlue") , bottomColor:isNight ? .gray : .white)
            VStack {
                WeatherDetailsView(cityName: "Cupertino, CA", weatherImageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                Spacer()
                LazyHStack(spacing: 25) {
                    ForEach(weeklyWeather, id: \.dayOfWeek) { day in
                        WeatherDayView(dayWeather: day)
                    }
                }
                Spacer()
                ChangeDayButtonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDetailsView: View {
    var cityName: String
    var weatherImageName: String
    var temp: Int
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        VStack {
            Image(systemName: weatherImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 150)
                .padding([.top], 70)
            Text("\(temp)°")
                .frame(width: 200, height: 100)
                .font(.system(size: 81, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding([.top], 20)
        }
    }
}

struct WeatherDayView: View {
    var dayWeather: WeatherDay
    var body: some View {
        VStack {
            Text(dayWeather.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: "\(dayWeather.weatherImage)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(dayWeather.temp)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundGradientView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ChangeDayButtonView: View {
    var body: some View {
        Button {
            print("Tapped")
        } label: {
            Text("Change Day Time.")
                .frame(width: 280, height: 50)
                .background(.cyan)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium, design: .default))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 4)
        }
    }
}
