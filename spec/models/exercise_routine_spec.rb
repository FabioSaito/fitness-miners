require 'rails_helper'

RSpec.describe ExerciseRoutine, type: :model do
  context 'associations' do
    it { should belong_to(:routine) }
    it { should belong_to(:exercise) }
  end
end
