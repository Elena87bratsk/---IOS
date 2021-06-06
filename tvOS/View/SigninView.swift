//
//  SigninView.swift
//  tvOS
//
//  Created by user on 06.06.2021.
//

import SwiftUI

struct SigninView: View {
    @State var username = ""
    @State var pussword = ""
    @StateObject var model = ViewModel()
    // переменные для всплывающего окна
    @State var message = ""
    @State var errorAlect = false
    var body: some View {
        ZStack(alignment: .top) {
            Image("bakroundImage").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                
                ZStack{
                    Rectangle()
                        .frame(width: 697, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                    HStack(spacing:0){
                        Image("username").padding()
                        Divider().frame(width: 1, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        CustomeUserName(plaseholder: Text("Ivanov"), username: $username).padding(.horizontal,10)
                    }
                    .frame(width: 697, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
                ZStack{
                Rectangle()
                    .frame(width: 697, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                HStack(spacing:0){
                    Image("pusswotd").padding()
                    Divider().frame(width: 1, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    CustomePussword(plaseholder: Text("******"), pussword: $pussword).padding(.horizontal,10)
                }
                .frame(width: 697, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
                Button(action: {
                    if pussword != "" && username != ""{
                        model.signIn(username: username, pussword: pussword)
                    } else {
                        errorAlect.toggle()
                        message = "Заполните все поля"
                    }
                }, label: {
                    ZStack{
                        Rectangle().frame(width: 697, height: 50
                                          , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                        Text ("Sign in").foregroundColor(.white).font(.custom("", size: 24))
                    }
                }).alert(isPresented: $errorAlect, content: {
                    Alert(title: Text("Error"), message: Text("\(message)"), dismissButton: .default(Text("Закрыть")))
                }).buttonStyle(PlainButtonStyle())
            }.offset(y:400)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
struct CustomeUserName: View {
    @State var plaseholder: Text
    @Binding var username: String
    @State var edit: (Bool) ->() = {_ in}
    @State var comit: () ->() = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if username.isEmpty {
                plaseholder.foregroundColor(.gray).font(.custom("", size: 24))
            }
            TextField("", text: $username, onEditingChanged: edit, onCommit: comit).frame(width: 630, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) .font(.custom("", size: 24)).foregroundColor(.gray)
       
        }
}
}
struct CustomePussword: View {
    @State var plaseholder: Text
    @Binding var pussword: String
    @State var edit: (Bool) ->() = {_ in}
    @State var comit: () ->() = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if pussword.isEmpty {
                plaseholder.foregroundColor(.gray).font(.custom("", size: 24))
            }
            TextField("", text: $pussword, onEditingChanged: edit, onCommit: comit).frame(width: 630, height: 50, alignment: .center) .font(.custom("", size: 24)).foregroundColor(.gray)
       
        }
    }
}
