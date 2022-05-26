require 'rails_helper'

RSpec.describe '/tasks', type: :request do

  describe 'GET /tasks' do
    let(:url) { '/tasks' }
    before do
      Fabricate(:task)
      get url
    end
    
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    
    it 'displays the correct number of tasks' do
      expect(JSON.parse(response.body)[0]["title"]).to eq Task.first.title
    end
  end

  describe 'POST /index' do
    let(:url) { '/tasks' }
    let(:params) do
      {
        task: {
          title: Faker::Verb.base
        }
      }
    end

    before do
      post url, params: params
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end
  
  
  describe 'POST /index' do
    let(:url) { '/tasks' }
    let(:params) do
      {
        task: {
          archived: "true"
        }
      }
    end

    before do
      task = Fabricate(:task)
      post url + "/#{task.id}", params: params
    end

    it 'renders a successful response' do
      expect(response).to be_successful
      expect(Task.first.archived).to eq "true"
    end
  end
end
