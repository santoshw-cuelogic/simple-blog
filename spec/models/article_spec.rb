require 'spec_helper'

RSpec.describe Article, type: :model do

  describe "Associations" do
    it { should { have_many :comments } }
  end


  describe "Validations" do
    it { is_expected.to respond_to(:subject) }
    it { is_expected.to respond_to(:description) }
  end

  describe "#set_posted_at" do
    context "should have current" do
      article = Fabricate.build(:article, subject: "dddq", description: "xyz", posted_at: "")
      it "posted_at date" do
        article.set_posted_at
        expect(article.posted_at).to eq(Date.today)
      end
    end
  end

  describe "Validate blank data" do
    context "should not allow" do
      article = Fabricate.build(:article, subject: "", description: "xyz")
      it "blank subject" do
        article.valid?
        expect(article.errors[:subject]).to include("can't be blank")
      end
    end

    context "should not allow" do
      article = Fabricate.build(:article, subject: "aaaa", description: "")
      it "blank subject" do
        article.valid?
        expect(article.errors[:description]).to include("can't be blank")
      end
    end
  end

  describe "Validate for duplication" do
    context "should not allow" do
    it "duplicate #subject" do
       Fabricate.build(:article, subject: "abc", description: "xyz")
       article = Fabricate.build(:article, subject: "abc", description: "xccyz")
       article.valid?
       expect(article.errors[:subject]).to include('has already been taken')
    end
    end
  end

  describe "Validate length" do

    context "subject should not allow" do
      article = Fabricate.build(:article, subject: "abc"*40, description: "xccyz")
      it "more than 100" do
        article.valid?
        expect(article.errors[:subject]).to include("is too long (maximum is 100 characters)")
      end
    end

    context "description should not allow" do
      article = Fabricate.build(:article, subject: "abc", description: "xyz"*1000)
      it "more than 2000" do
        article.valid?
        expect(article.errors[:description]).to include("is too long (maximum is 2000 characters)")
      end
    end

  end

end
