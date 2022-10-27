//
//  ContentView.swift
//  ColorSelector
//
//  Created by Noah Alexandre Soubliere on 2022-10-27.
//

import SwiftUI

struct ContentView: View {
  
    //MARK: Stored properties
    @State private var selectedHue = 0.0
    
    //tracks the list of saved Palettes
    @State private var savedPalettes: [SavedPalette] = [] //empyty
    //MARK: Computed properties
    
    //The selected hue express as a value betwene 0 and 1.0
    private var hue: Double {
        return selectedHue / 360.0
    }
    
    //Make the color that SwiftUI will use to set the background of the color swatch
    private var baseColor: Color {
        return Color(hue: hue, saturation: 0.8, brightness: 0.9)
    }
 
    private var darkColor: Color {
        return Color(hue: hue, saturation: 0.8, brightness: 0.7)
    }
    
    private var darkerColor: Color {
        return Color(hue: hue, saturation: 0.8, brightness: 0.5)
    }

    
    //Interface
    var body: some View {
        VStack {
            
            VStack{

                
            }
            .frame(width: 200, height: 200)
            .background(baseColor)
            
            Text("Hue")
                .bold()
            Text("\(selectedHue.formatted(.number.precision(.fractionLength(1))))°")
            Slider(value: $selectedHue,
                   in: 0...360,
                   label: { Text("Hue")},
                   minimumValueLabel: {Text("0")},
                   maximumValueLabel: {Text("360")})
 
            HStack(spacing:0){
                
                VStack{
                    
                }
                .frame(width: 75, height: 75)
                .background(baseColor)
                
                VStack{
                    
                }
                .frame(width: 75, height: 75)
                .background(darkColor)
                
                VStack{
                    
                }
                .frame(width: 75, height: 75)
                .background(darkerColor)
            }

            Button(action: {
                //Create a new palette instance
                let newPalette = SavedPalette(hue: hue)
                //add it to the list
                savedPalettes.append(newPalette)
            },
                   label: {
                Text("Save")
            })
         
            Spacer()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
