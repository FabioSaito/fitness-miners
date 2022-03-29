require 'rails_helper'

RSpec.describe Exercise, type: :model do
  context 'associations' do
    it { should have_many(:routines) }
    it { should have_many(:exercise_routines) }
  end
  
  context 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:intensity) }
    it { should validate_numericality_of(:intensity).only_integer }
    it { should validate_numericality_of(:intensity).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:intensity).is_less_than_or_equal_to(10) }
  end
end
