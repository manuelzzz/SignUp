//
//  ContentView.swift
//  SignUp
//
//  Created by Manuel Santos Souza on 29/10/25.
//

import SwiftUI

struct ContentView: View {
	@State var username = ""
	@State var password = ""

	var body: some View {
		ZStack {
			Color.primaryTheme.ignoresSafeArea()
			VStack(alignment: .leading, spacing: 24) {
				Text("Sign Up")
					.font(.system(size: 32, weight: .heavy))
					.foregroundStyle(.white)
				Text("Username")
					.font(.system(size: 16, weight: .bold))
					.foregroundStyle(.white)
				TextField("Username", text: $username)
					.textFieldStyle(.roundedBorder)
					.textContentType(.username)
					.textInputAutocapitalization(.never)
					.autocorrectionDisabled()
				Text("Email")
					.font(.system(size: 16, weight: .bold))
					.foregroundStyle(.white)
				TextField("Email", text: $username)
					.textFieldStyle(.roundedBorder)
					.textContentType(.emailAddress)
					.textInputAutocapitalization(.never)
					.autocorrectionDisabled()
				Text("Password")
					.font(.system(size: 16, weight: .bold))
					.foregroundStyle(.white)
				SecureField("Password", text: $password)
					.textFieldStyle(.roundedBorder)
				Button(
					action: {},
					label: {
						Text("Submit")
							.foregroundStyle(.white)
							.font(.system(size: 16, weight: .semibold))
							.frame(maxWidth: .infinity)
							.frame(height: 50)
					}
				)
				.background(.black)
				.clipShape(RoundedRectangle(cornerRadius: 8))
				.padding(.top)
				Spacer()
			}
			.padding(.horizontal)
		}
	}
}

#Preview {
	ContentView()
}
