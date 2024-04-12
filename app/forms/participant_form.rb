class ParticipantForm < ApplicationForm
  form do |participant_form|
    participant_form.submit(
      name: :submit,
      label: "参加する",
      scheme: :primary,
    )
  end
end
