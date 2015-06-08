require 'spec_helper'

describe Article do

  describe "Associations" do
    it {
      should {
        have_many :comments
      }
    }
  end

  describe "Validations" do
    it { is_expected.to respond_to(:subject) }
    it { is_expected.to respond_to(:description) }
  end

end



