//
//  emailedView.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct emailedView: View {
    var session = Session()
    @State private var  dataEmailed : Emailed?
    @State var selectedPeriod = 1
    var body: some View {
        VStack{
            Section{
                Image("logoNYTOneLine")
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    .onAppear(perform: {
                        session.urlSesionInit(url: "\(ServiceUrl.base.rawValue)emailed/\(ServiceUrl.period1.rawValue)\(ServiceUrl.jsonValue.rawValue)\(ServiceUrl.apiKey.rawValue)")
                        
                    })
                
                HStack{
                    Button(action: {
                        selectedPeriod = 1
                        session.urlSesionInit(url: "\(ServiceUrl.base.rawValue)emailed/\(ServiceUrl.period1.rawValue)\(ServiceUrl.jsonValue.rawValue)\(ServiceUrl.apiKey.rawValue)")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            _ = session.$emailed.sink(receiveCompletion: { _ in
                            }, receiveValue: { data in
                                self.dataEmailed = data
                            })
                        })
                    }, label: {
                        Text("1").font(.title).padding().containerShape(Rectangle())
                            .background(selectedPeriod == 1 ? Color.gray : Color.white).clipShape(Circle())
                    })
                    Button(action: {
                        selectedPeriod = 7
                        session.urlSesionInit(url: "\(ServiceUrl.base.rawValue)emailed/\(ServiceUrl.period2.rawValue)\(ServiceUrl.jsonValue.rawValue)\(ServiceUrl.apiKey.rawValue)")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            _ = session.$emailed.sink(receiveCompletion: { _ in
                            }, receiveValue: { data in
                                self.dataEmailed = data
                            })
                        })
                    }, label: {
                        Text("7").font(.title).padding().containerShape(Rectangle())
                            .background(selectedPeriod == 7 ? Color.gray : Color.white).clipShape(Circle())
                    })
                    ZStack{
                        
                            
                        Button(action: {
                        selectedPeriod = 30
                        session.urlSesionInit(url: "\(ServiceUrl.base.rawValue)emailed/\(ServiceUrl.period3.rawValue)\(ServiceUrl.jsonValue.rawValue)\(ServiceUrl.apiKey.rawValue)")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            _ = session.$emailed.sink(receiveCompletion: { _ in
                            }, receiveValue: { data in
                                self.dataEmailed = data
                            })
                        })
                        
                    }, label: {
                        ZStack{
                            Text("30").font(.title).padding()
                                .background(selectedPeriod == 30 ? Color.gray : Color.white).clipShape(Circle())
                        }
                    })
}
                                    }
            }
            
            VStack{
                // Cards
                

            }
            VStack{
                NavigationStack{
                    if let dataEmailed = dataEmailed {
                        
                        var articleData : [(String, URL?, String, String, String)] {
                            dataEmailed.results.map{($0.title, URL(string: $0.media.first?.mediaMetadata.first?.url ?? ""), $0.source, $0.publishedDate, $0.abstract)}
                        }
                                                    
                            
                            
                            Section {
                                ScrollView {
                                    VStack(alignment: .leading, spacing: 10) {
                                        ForEach(articleData, id: \.0) { title, imageUrl, author, publishedDate, abstract in
                                            NavigationLink {
                                                ArticleDetail(articleData: [(title, imageUrl, author, publishedDate, abstract)])
                                            } label: {
                                                HStack(alignment: .center, spacing: 10) {
                                                    if let url = imageUrl {
                                                        AsyncImage(url: url) { image in
                                                            image
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 50, height: 50)
                                                                .clipShape(Circle())
                                                        } placeholder: {
                                                            ProgressView() // Indicador de carga mientras se descarga la imagen
                                                        }
                                                    } else {
                                                        Image(systemName: "photo") // Imagen por defecto si no hay URL
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 50, height: 50)
                                                            .foregroundColor(.gray)
                                                    }
                                                    
                                                    ZStack{
                                                        Rectangle().foregroundStyle(.clear)
                                                        Text(title)
                                                            .font(.headline)
                                                            .padding()
                                                            .background(Color.gray.opacity(0.2))
                                                            .cornerRadius(8)
                                                            .frame(width: 250)
                                                    }
                                                        
                                                            
                                                    
                                                    Image(systemName: "plus.app.fill")
                                                        .font(.system(size: 30))
                                                        .foregroundStyle(.green)
                                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                                                    
                                                    
                                                }
                                            }

                                            
                                        }
                                    }
                                    .padding()
                                }
                            }
                            
                        
                        
                    }else {
                    
                        ProgressView().onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                _ = session.$emailed.sink(receiveCompletion: { _ in
                                }, receiveValue: { data in
                                    self.dataEmailed = data
                                })
                            }
                            
                        })
                        
                    }
                    
                }
            }
            
            
            
            
        }
        
    }
}

#Preview {
    emailedView()
}
