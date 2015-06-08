require 'spec_helper'

describe Comment do

  describe "Associations" do
    it {
      should {
        belongs_to :article
      }
    }
  end

  describe "Validations" do
    it { is_expected.to respond_to(:guest_name) }
    it { is_expected.to respond_to(:guest_email) }
    it { is_expected.to respond_to(:comment) }
  end

end



