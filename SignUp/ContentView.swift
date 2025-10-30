//
//  ContentView.swift
//  SignUp
//
//  Created by Manuel Santos Souza on 29/10/25.
//

import SwiftUI

struct ContentView: View {
	@State var username = ""
	@State var usernameError: String? = nil
	@State var email = ""
	@State var emailError: String? = nil
	@State var password = ""
	@State var passwordError: String? = nil
	@State var showAlert = false

	func validateFields() -> Bool {
		let isUsernameValid = validateUsername()
		let isEmailValid = validateEmail()
		let isPasswordValid = validatePassword()

		return isUsernameValid && isEmailValid && isPasswordValid
	}

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
				if let usernameError {
					Text(usernameError)
						.font(.system(size: 12))
						.foregroundStyle(.red)
				}
				Text("Email")
					.font(.system(size: 16, weight: .bold))
					.foregroundStyle(.white)
				TextField("Email", text: $email)
					.textFieldStyle(.roundedBorder)
					.textContentType(.emailAddress)
					.textInputAutocapitalization(.never)
					.autocorrectionDisabled()
				if let emailError {
					Text(emailError)
						.font(.system(size: 12))
						.foregroundStyle(.red)
				}
				Text("Password")
					.font(.system(size: 16, weight: .bold))
					.foregroundStyle(.white)
				SecureField("Password", text: $password)
					.textFieldStyle(.roundedBorder)
				if let passwordError {
					Text(passwordError)
						.font(.system(size: 12))
						.foregroundStyle(.red)
				}
				Button(
					action: {
						showAlert = validateFields()
					},
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
		.alert("Sign Up Completed!", isPresented: $showAlert) {
			Button("Ok", action: {})
		} message: {
			Text("Thanks for signing up!")
		}
	}

	func validateUsername() -> Bool {
		guard !username.isEmpty else {
			usernameError = "Username is required."
			return false
		}

		usernameError = nil
		return true
	}

	func validateEmail() -> Bool {
		guard !email.isEmpty else {
			emailError = "Email is required."
			return false
		}

		guard !email.contains(#"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#) else {
			emailError = "Input an valid email."
			return false
		}

		emailError = nil
		return true
	}

	func validatePassword() -> Bool {
		guard !password.isEmpty else {
			passwordError = "Password is required."
			return false
		}

		guard password.count >= 6 else {
			passwordError = "Password needs 6 or more characters."
			return false
		}

		passwordError = nil
		return true
	}

}

#Preview {
	ContentView()
}
