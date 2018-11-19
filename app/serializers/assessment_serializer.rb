class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :pt, :crusher, :days, :enduro, :trainable, :static, :mental, :flexible, :tendonitis
end
