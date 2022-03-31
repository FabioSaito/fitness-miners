require 'rails_helper'

RSpec.describe Routine, type: :model do
  context 'associations' do
    it { should have_many(:exercises).through(:exercise_routines) }
    it { should have_many(:exercise_routines) }
    it { should have_many(:exercise_routines).dependent(:destroy) }
  end
end
