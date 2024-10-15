//
//  CashInOutView.swift
//
//
//  Created by Bodgar Espinosa Miranda on 18/09/24.
//

import SwiftUI
import DesignSystem
import CashSwitchboard

public struct CashInOutView: View {
    
    @ObservedObject private var viewModel: CashInOutViewModel
    
    public init(viewModel: CashInOutViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                VStack {
                    viewModel.icon.image
                        .resizable()
                        .frame(width: 50, height: 50)
                    GenericText(configuration:
                            .init(title: viewModel.title,
                                  colorTitle: viewModel.colorTexts,
                                  sizeTitle: .xLarge, isBold: true
                                 )
                    )
                    Spacer().frame(height: 10)
                    GenericText(configuration:
                            .init(
                                title: viewModel.subtitle,
                                colorTitle: .black.opacity(0.6)
                            )
                    )
                }.multilineTextAlignment(.center)
                
                VStack {
                    HStack {
                        GenericText(configuration:
                                .init(title: viewModel.transactionType,
                                      colorTitle: viewModel.colorTexts,
                                      sizeTitle: .large
                                     )
                        )
                        .padding(.top)
                        .padding(.leading)
                        Spacer()
                    }
                    GenericTextField(text: $viewModel.amount, configuration: .init(placeholder: viewModel.transactionPlaceholder, fontSize: .large, cornerRadius: .xxLarge, keyboardType: .decimalPad))
                        .padding(.leading)
                        .padding(.trailing)
                    
                    HStack {
                        GenericText(configuration:
                                .init(title: "Detalle",
                                      colorTitle: viewModel.colorTexts,
                                      sizeTitle: .large
                                     )
                        )
                        .padding(.top)
                        .padding(.leading)
                        Spacer()
                    }
                    GenericTextField(text: $viewModel.subcategory, configuration: .init(placeholder: "Escribe el detalle del \(viewModel.transactionType)", fontSize: .large, cornerRadius: .xxLarge, keyboardType: .decimalPad))
                        .padding(.leading)
                        .padding(.trailing)
                    
                    HStack {
                        GenericText(configuration:
                                .init(title: "Categoría",
                                      colorTitle: viewModel.colorTexts,
                                      sizeTitle: .large
                                     )
                        )
                        .padding(.top)
                        .padding(.leading)
                        Spacer()
                    }

                    MenuTextField(
                        selectedOption: $viewModel.category,
                        options: $viewModel.categories.wrappedValue,
                        backgroundColor: viewModel.colorTexts,
                        titleColor: .white)
                    .padding(.leading)
                    .padding(.trailing)
                    
                    RoundedButton(textConfiguration: .init(title: "Añadir \(viewModel.transactionType)", colorTitle: .white, sizeTitle: .large ,isBold: true), backgroundColor: viewModel.colorTexts) {
                        self.viewModel.saveData()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .alert(isPresented: $viewModel.showingAlert) {
                        Alert(title: Text("CASH"), 
                              message: Text(viewModel.alertMessage),
                              dismissButton: .default(Text("Ok")) {
                            self.viewModel.sendToBalanceView()
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    CashInOutView(viewModel: CashInOutViewModel(type: "cashIn"))
}

#Preview {
    CashInOutView(viewModel: CashInOutViewModel(type: "cashOut"))
}
