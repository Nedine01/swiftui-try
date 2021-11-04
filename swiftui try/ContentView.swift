//
//  ContentView.swift
//  swiftui try
//
//  Created by Yasmine Rafid on 10/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
        //try1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var signUp = false
    @State var user = ""
    @State var pass = ""
    @State var rePass = ""
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            
            ZStack{
                
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                
                Color("Color")
                    .clipShape(CShape())
                
                //adding another curve (the white one)
                
                Path { path in
                    
                    path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                }
                .fill(Color.white)
                
                //adding buttons
                
                Button(action: {
                    withAnimation(.easeIn){
                        self.signUp = false
                    }
                    
                }){
                    Image(systemName: signUp ? "xmark" : "person.fill")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color("Color"))
                }
                .offset(x: -105, y: -50)
                .disabled(signUp ? false : true) //disabling button when not in use
                
                Button(action: {
                    
                    withAnimation(.easeOut){
                        self.signUp = true
                    }
                    
                }){
                    Image(systemName: signUp ? "person.badge.plus.fill" : "xmark")
                        .font(.system(size: signUp ? 26 : 25, weight: .bold))
                        .foregroundColor(.white)
                }
                .offset(x: -28, y: -30)
                .disabled(signUp ? true : false)
                }
                
                //login view
                VStack(alignment: .leading, spacing: 25){
                    
                    Text("Login")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Username")
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    VStack{
                        
                        TextField("Username", text: $user)
                        
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    Text("Password")
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    VStack{
                        
                        SecureField("Password", text: $pass)
                        
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        //login button
                        
                        Button(action: {}){
                            
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                                .padding(.vertical)
                                .padding(.horizontal , 45)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top , (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 25)
                .padding()
            }
            
            //moving view up
            .offset(y: signUp ? -UIScreen.main.bounds.height + (UIScreen.main.bounds.height < 750 ? 100 : 130) : 0)
            .zIndex(1) //moving view front in stack
            
            //signup view
            VStack(alignment: .leading, spacing: 25){
                
                Text("Sign Up")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color("Color"))
                
                Text("Username")
                    .foregroundColor(Color("Color"))
                    .padding(.top, 10)
                
                VStack{
                    
                    TextField("Username", text: $user)
                    
                    Divider()
                        .background(Color("Color").opacity(0.5))
                }
                
                Text("Password")
                    .foregroundColor(Color("Color"))
                    .padding(.top, 10)
                
                VStack{
                    
                    SecureField("Password", text: $pass)
                    
                    Divider()
                        .background(Color("Color").opacity(0.5))
                }
                
                Text("Re-Enter")
                    .foregroundColor(Color("Color"))
                    .padding(.top, 10)
                
                VStack{
                    
                    SecureField("Re-Enter", text: $rePass)
                    
                    Divider()
                        .background(Color("Color").opacity(0.5))
                }
                
                HStack {
                    
                    Spacer()
                    
                    //login button
                    
                    Button(action: {}){
                        
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal , 45)
                            .background(Color("Color"))
                            .clipShape(Capsule())
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                Spacer(minLength: 0)
                
            }
            .padding(.top , (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 50)
            .padding()
            
            
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        
        //changing UI style 
        //.preferredColorScheme(signUp ? .light : .dark)
    }
}

//custom shape
struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            //starting from bottom
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y:0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 50))
            
            //adding curve (bottom right corner)
            
            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}
