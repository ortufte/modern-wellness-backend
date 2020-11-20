class MedicineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :id, :name, :dosage, :note
end
