class DaySerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_name, :exercise_description

  def exercise_name
    if object.exercises != []
      object.exercises[0].name
    end
  end

  def exercise_description
    if object.exercises != []
      object.exercises[0].description
    end
  end
end
