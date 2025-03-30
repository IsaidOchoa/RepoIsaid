extends Control

func _ready():
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)

func _on_login_button_pressed():
	var email = %Email.text
	var password = %Password.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%StateLabel.text = "Loggin in"

func _on_signup_button_pressed():
	var email = %Email.text
	var password = %Password.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%StateLabel.text = "Sign up"

func on_login_succeeded(auth):
	print(auth)
	%StateLabel.text = "Loggin success"
	get_tree().change_scene_to_file("res://loading_bar.tscn")

func on_signup_succeeded(auth):
	print(auth)
	%StateLabel.text = "Signup success"

func on_login_failed(error_code, massage):
	print(error_code)
	print(massage)
	%StateLabel.text = "login fail. Error: %s" % massage

func on_signup_failed(error_code, massage):
	print(error_code)
	print(massage)
	%StateLabel.text = "signup fail. Error: %s" % massage
