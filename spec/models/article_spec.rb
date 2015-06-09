require 'spec_helper'

RSpec.describe Article, type: :model do

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

  describe "Validate blank data" do
    let(:article) { Fabricate(:article, subject: "", description: "xyz") }
    context "should not allow" do
      it "blank #subject" do
        article.valid?
        expect(article.errors[:subject]).to include("can't be blank")
      end
    end

    let(:article) { Fabricate(:article, subject: "ddd", description: "") }
    context "should not allow" do
      it "blank #description" do
        article.valid?
        expect(article.errors[:description]).to include("can't be blank")
      end
    end
  end

  describe "Validate for duplication" do
    let(:article) { Fabricate(:article, subject: "dup", description: "xyz") }
    let(:article1) { Fabricate(:article, subject: "dup", description: "xyz") }
    context "should not allow" do
     it "duplicate #subject" do
       article.valid?
       expect { article1.errors[:subject] }.to eql('has already been taken')
     end
    end
  end

  describe "Validate subject length" do
    let(:article) { Fabricate(:article, subject: "xyz"*40, description: "xyz") }

    context "should not allow" do
      it "more than 100" do
        expect { article.count }.to eq(1)
      end
    end
  end

  describe "Validate description length" do
    let(:article) { Fabricate(:article, subject: "xyz", description: "xyz"*1000) }

    context "should not allow" do
      it "more than 2000" do
        expect { article.count }.to eq(1)
      end
    end
  end

end
