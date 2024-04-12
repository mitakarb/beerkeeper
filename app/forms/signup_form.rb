class SignupForm < ApplicationForm
  form do |signup_form|
    signup_form.text_field(
      name: :name,
      type: "text",
      label: '名前',
      required: true,
    )

    signup_form.text_field(
      name: :email,
      type: "email",
      label: 'メールアドレス',
      required: true,
    )

    signup_form.text_field(
      name: :password,
      type: "password",
      label: 'パスワード',
      required: true,
    )

    signup_form.text_field(
      name: :password_confirmation,
      type: "password",
      label: 'パスワード（確認用）',
      required: true,
    )

    signup_form.submit(
      name: :submit,
      label: '登録',
      scheme: :primary,
      mb: 3
    )
  end

  def initialize()
  end
end
