require 'rails_helper'

RSpec.describe Review, type: :model do
  before do 
    @review = build(:review)
  end
  describe 'バリデーション' do
    context "店舗ID、星の値、コメントがある場合" do
      it '有効であること' do
        expect(@review.valid?).to eq(true)
      end
    end
    context "店舗IDが無い場合" do
      it '無効であること' do
        @review.shop_id = nil
        @review.valid?
        expect(@review.errors[:shop_id]).to include("can't be blank")
      end
    end
    context "星の値が無い場合" do
      it '無効であること' do
        @review.star = nil
        @review.valid?
        expect(@review.errors[:star]).to include("can't be blank")
      end
    end
    context "コメントが無い場合" do
      it '無効であること' do
        @review.comment = nil
        @review.valid?
        expect(@review.errors[:comment]).to include("can't be blank")
      end
    end
  end
end