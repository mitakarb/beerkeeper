class LoginForm < ApplicationForm
  form do |login_form|
    login_form.text_field(
      name: :email,
      label: 'メールアドレス',
      required: true,
    )

    login_form.text_field(
      name: :password,
      label: 'パスワード',
      required: true,
    )

    login_form.submit(
      name: :submit,
      label: 'ログイン',
    )
  end

  def initialize()

  end
end
