class LoginForm < ApplicationForm
  form do |login_form|
    login_form.text_field(
      name: :email,
      type: "email",
      label: 'メールアドレス',
      required: true,
    )

    login_form.text_field(
      name: :password,
      type: "password",
      label: 'パスワード',
      required: true,
    )

    login_form.submit(
      name: :submit,
      label: 'ログイン',
      scheme: :primary,
      mb: 3
    )
  end
end
