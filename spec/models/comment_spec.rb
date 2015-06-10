require 'spec_helper'

RSpec.describe Comment, type: :model do

  describe "Associations" do
    it { should { belongs_to :article } }
  end

  describe "Validations" do
    it { is_expected.to respond_to(:guest_name) }
    it { is_expected.to respond_to(:guest_email) }
    it { is_expected.to respond_to(:comment) }
  end

  describe "Validate format" do
    context "should not allow" do
      comment = Fabricate.build(:comment, guest_name: "", comment: "xyz", guest_email: "santoshgmail.com")
      it "invalid email" do
        comment.valid?
        expect(comment.errors[:guest_email]).to include("E-Mail is invalid.")
      end
    end
  end

  describe "#set_comment_date" do
    context "should have current" do
      comment = Fabricate.build(:comment, guest_name: "xxx", comment: "xyz", guest_email: "santosh@gmail.com", comment_date: "")
      it "comment_date" do
        comment.set_comment_date
        expect(comment.comment_date).to eq(Date.today)
      end
    end
  end

  describe "Validate blank data" do

    context "should not allow" do
      comment = Fabricate.build(:comment, guest_name: "", comment: "xyz", guest_email: "santosh@gmail.com")
      it "blank name" do
        comment.valid?
        expect(comment.errors[:guest_name]).to include("can't be blank")
      end
    end

    context "should not allow" do
      comment = Fabricate.build(:comment, guest_name: "abc", comment: "", guest_email: "santosh@gmail.com")
      it "blank comment" do
        comment.valid?
        expect(comment.errors[:comment]).to include("can't be blank")
      end
    end

    context "should not allow" do
      comment = Fabricate.build(:comment, guest_name: "abc", comment: "sdsdsds", guest_email: "")
      it "blank email" do
        comment.valid?
        expect(comment.errors[:guest_email]).to include("can't be blank")
      end
    end
  end

end
