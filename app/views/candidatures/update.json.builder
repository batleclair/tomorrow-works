if @candidature.persisted?
  json.inserted_item render(partial: "candidatures/count", formats: :html, locals: {candidatures: @candidatures})
end
