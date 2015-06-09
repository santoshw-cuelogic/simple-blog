require 'spec_helper'

RSpec.describe Comment, type: :model do

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

  describe "Validate blank data" do
    let(:comment) { Fabricate(:comment, guest_name: "", comment: "xyz", guest_email: "santosh@gmail.com") }
    context "should not allow" do
      it "blank #guest_name" do
        article.valid?
        expect(article.errors[:guest_name]).to include("can't be blank")
      end
    end

    let(:comment) { Fabricate(:comment, guest_name: "ssss", comment: "", guest_email: "santosh@gmail.com") }
    context "should not allow" do
      it "blank #comment" do
        article.valid?
        expect(article.errors[:comment]).to include("can't be blank")
      end
    end

    let(:comment) { Fabricate(:comment, guest_name: "ssss", comment: "dddd", guest_email: "") }
    context "should not allow" do
      it "blank #email" do
        article.valid?
        expect(article.errors[:guest_email]).to include("can't be blank")
      end
    end

  end

end
