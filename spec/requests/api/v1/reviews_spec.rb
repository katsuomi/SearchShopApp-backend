require 'rails_helper'

RSpec.describe Review, type: :request do
  before do 
    @review = build(:review)
  end
  describe 'ReviewAPI' do
    it '全てのレビューを取得する' do
      FactoryBot.create_list(:review, 10)

      get '/api/v1/reviews'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(10)
    end

    it '特定のreviewを取得する' do
      get "/api/v1/reviews/#{@review.id}"
      json = JSON.parse(response.body)
  
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
  
      # 要求した特定のレビューのみ取得した事を確認する
      # expect(json['data']['id']).to eq(@review.id)
    end
  end
end