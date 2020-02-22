//
//  AuthorizationView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import Combine
import Moya

public struct AuthorizationView: View  {
    
    @ObservedObject var viewModel: AuthorizationViewModel
    public var body: some View {
        Color.baseBackgroung
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack(spacing: 50) {
                    VStack(spacing: 20) {
                        Text("Активация устройства")
                            .font(.system(size: 20, weight: Font.Weight.semibold))
                            .frame(alignment: .leading)
                            .foregroundColor(Color.baseText)
                        Text("Для начала нужно активировать это устройство. Перейдите на сайт и в своём профиле в графе «Активация устройства» введите код и нажмите «Добавить». После этого возвращайтесь в приложение.  Код автоматически копируется в буфер обмена.")
                            .lineLimit(nil)
                            .font(.system(size: 14, weight: Font.Weight.regular))
                            .foregroundColor(Color.baseText)
                            .multilineTextAlignment(.center)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    VStack(spacing: 5) {
                        Text(viewModel.code)
                            .font(.system(size: 34, weight: Font.Weight.bold))
                            .foregroundColor(Color.baseText)
                            .frame(minHeight: 44, idealHeight: 44, maxHeight: 44)
                        Text("Код устройства")
                            .foregroundColor(Color.baseText)
                            .font(.system(size: 14, weight: Font.Weight.regular))
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    Button("Активировать", action: viewModel.action)
                        .foregroundColor(Color.baseText)
                        .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.baseText, lineWidth: 2)
                    )
                }
                .padding(EdgeInsets.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                .fixedSize(horizontal: false, vertical: true)
        )
    }
}
