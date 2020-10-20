class LogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :date, :medicine, :symptom_level, :note
end
