require 'rails_helper'

RSpec.describe Routine, type: :model do
  context 'associations' do
    it { should have_many(:exercises) }
    it { should have_many(:exercise_routines) }
  end
end
