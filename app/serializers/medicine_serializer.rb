class MedicineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :dosage, :note
end
