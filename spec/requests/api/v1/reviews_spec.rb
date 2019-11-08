require 'rails_helper'

RSpec.describe Review, type: :request do
  describe 'ReviewAPI' do
    it '全てのreviewを取得する' do
      FactoryBot.create_list(:review, 10)

      get '/api/v1/reviews'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(10)
    end

    it '新しいreviewを作成する' do
      valid_params = { star: 3,comment: "content",shop_id: "83fhj238f" }
  
      #データが作成されている事を確認
      expect { post '/api/v1/reviews', params: { review: valid_params } }.to change(Review, :count).by(+1)
  
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end

    it '特定のreviewを取得する' do
      review = create(:review)

      get "/api/v1/reviews/#{review.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
      # 要求した特定のreviewのみ取得した事を確認する。
      expect(json['data']['id']).to eq(review.id)
    end

    it '特定のreviewの更新を行う' do
      review = create(:review, comment: 'comment')
  
      put "/api/v1/reviews/#{review.id}", params: { review: {comment: 'new_comment'}  }
      json = JSON.parse(response.body)
      
      p json['data']
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
  
      #データが更新されている事を確認
      expect(json['data']['comment']).to eq('new_comment')
    end

    it '特定のreviewを削除する' do
      review = create(:review)

      #データが削除されている事を確認
      expect { delete "/api/v1/reviews/#{review.id}" }.to change(Review, :count).by(-1)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end

    it '特定の店舗のreviewを取得する' do
      review = create(:review, shop_id: "t24jg46ofegaj")
      review2 = create(:review, shop_id: "t24jg46ofegaj")
      review3 = create(:review, shop_id: "fjirowei")

      get "/api/v1/shop_show?shop_id=t24jg46ofegaj"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
      # 要求した特定の店舗のreviewのみ取得した事を確認する。
      expect(json['data'].length).to eq(2)
    end




  end
end