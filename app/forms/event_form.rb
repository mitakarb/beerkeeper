class EventForm < ApplicationForm
  form do |event_form|
    event_form.text_field(
      name: :name,
      type: "text",
      label: 'タイトル',
      required: true,
    )

    event_form.text_field(
      name: :description,
      type: "text",
      label: '説明',
      required: true,
    )

    event_form.text_field(
      name: :location,
      type: "text",
      label: '場所',
    )

    event_form.text_field(
      name: :max_size,
      type: "number",
      label: '最大人数',
    )

    event_form.text_field(
      name: :budget,
      type: "text",
      label: '予算',
    )

    event_form.text_field(
      name: :start_at,
      type: "datetime-local",
      label: '開始日時',
      required: true,
    )

    event_form.text_field(
      name: :end_at,
      type: "datetime-local",
      label: '終了日時',
      required: true,
    )

    event_form.submit(
      name: :submit,
      label: "登録",
      scheme: :primary,
      mb: 3
    )
  end
end
