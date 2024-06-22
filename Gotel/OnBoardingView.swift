//
//  OnBoardingView.swift
//  Gotel
//
//  Created by Andres Lopez on 21/06/24.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "onboarding_step1", title: "¿Estas buscando un hotel?", description: "En Gotel encontrarás los mejores hoteles cerca a ti"),
    OnBoardingStep(image: "onboarding_step2", title: "¿Quieres la mejor habitación?", description: "Con Gotel puedes visualizar y escoger la mejor habitación a gusto tuyo"),
    OnBoardingStep(image: "onboarding_step3", title: "¿Deseas los mejores servicios?", description: "Gotel muestra los mejores servicios en cada hotel")
]

struct OnBoardingView: View {
    
    @State private var currentStep = 0
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    withAnimation{
                        self.currentStep = onBoardingSteps.count - 1
                    }
                }){
                    Text("Omitir")
                        .padding(16)
                        .foregroundColor(.gray)
                }
            }
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingSteps.count, id: \.self){ index in
                    VStack{
                        Image(onBoardingSteps[index].image)
                            .resizable()
                            .frame(width: 250,height: 250)
                            .padding(.bottom,20)
                        Text(onBoardingSteps[index].title)
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding([.horizontal, .bottom], 10)
                        Text(onBoardingSteps[index].description)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,32)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack{
                ForEach(0..<onBoardingSteps.count, id: \.self) { index in
                    if index == currentStep {
                        Rectangle()
                            .frame(width: 20,height: 10)
                            .cornerRadius(10)
                            .foregroundColor(.purple)
                    } else {
                        Circle()
                            .frame(width: 10,height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.bottom,24)
            
            Button(action:{
                withAnimation{
                    if self.currentStep < onBoardingSteps.count - 1{
                        self.currentStep += 1
                    } else {
                        self.currentStep = 0
                        // TODO Navigate to main screen
                    }
                }
            }){
                Text(currentStep < onBoardingSteps.count - 1 ? "Continuar" : "Empezar")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(20)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .animation(.easeInOut,value: currentStep)
        
    }
}

#Preview {
    OnBoardingView()
}
