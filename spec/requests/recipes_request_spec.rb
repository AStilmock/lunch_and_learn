require 'rails_helper'

RSpec.describe 'Recipes API' do
  describe 'api request response path' do
    it 'successful request' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france&type=public")
      .to_return(status: 200, body: json_response)
      get '/api/v1/recipes', params: {country: 'france'}, headers: { 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'gets recipe data keys' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france&type=public")
      .to_return(status: 200, body: json_response)
      get '/api/v1/recipes', params: {country: 'france'}, headers: { 'Accept' => 'application/json' }
      recipes = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(recipes).to be_a Array
      expect(recipes.first).to have_key :id
      expect(recipes.first).to have_key :type
      expect(recipes.first).to have_key :attributes
      expect(recipes.first[:attributes]).to be_a Hash
      expect(recipes.first[:attributes]).to have_key :title
      expect(recipes.first[:attributes]).to have_key :url
      expect(recipes.first[:attributes]).to have_key :country
      expect(recipes.first[:attributes]).to have_key :image
    end
    
    it 'gets recipe data from keys' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france&type=public")
      .to_return(status: 200, body: json_response)
      get '/api/v1/recipes', params: {country: 'france'}, headers: { 'Accept' => 'application/json' }
      recipes = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(recipes.count).to eq 20
      expect(recipes.first[:id]).to eq "null"
      expect(recipes.first[:type]).to eq "recipe"
      expect(recipes.first[:attributes][:title]).to eq "Herb And White Wine Granita"
      expect(recipes.first[:attributes][:url]).to eq "http://www.food52.com/recipes/351_herb_and_white_wine_granita"
      expect(recipes.first[:attributes][:country]).to eq "france"
      expect(recipes.first[:attributes][:image]).to eq "https://edamam-product-images.s3.amazonaws.com/web-img/88a/88a8388d0f4efdb31fc25dbd975d9b5e.JPG?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIFl89Z4eip7kAAmCtSs7ESobDuWN6%2F8ukb7uR7lMV17RAiEAyYrA7qYxUcZIw5b4Ws%2BbLn0Vf7HvJ2mYGiP26BnNzV8quQUIThAAGgwxODcwMTcxNTA5ODYiDGx2pdYBQEvjUOoIuSqWBSoCWMhEsJ1GJJbSQQtF2NCb6%2BQ%2BpKZP8XMCKBw2UELAhEcgQQ4pVS0rrGQLfnDcvpIpDH6Dm8YFjygreoVta%2FVn%2BLvlC2vVizv9ev%2FMwEdg9IQM2nzP2cy7%2FyWImWTwJVtEd2XtJHiVwT493bRirJ2EQFEFlEnzq%2FE3EPXzamHPZjPTYOvVG8acmLfYqRVDnKI3bc%2F7Shjxhd%2BH8RS5Pb0qbFEaOWTCebqphLikGny3x82qK2AUhiYtQi5xNeftwpmIvx6NiQp67Ve7qyJJ8I8azP8OBE%2FkkGFyJVtETc5sSNuD7jtTo7hCixADBzHSiYBS8gjbn4Iy8t1CwsDRPvBZc0o6BsQWrHKPDaVeByMFV2Ci5K1Tfl%2BotBKw%2Fiig1xIJ8yH1Ace3oCSwTniacXvbfphFAzoxuuirJSc0aLDbzlbfEh5bm0XhGnDOxDr%2BNNJ04UKoaveTL1gS9HFC51TZQHmJrsMDFdTUm8OuQs%2FK9eVAwgkEL0kpohokp7gkNRB1DyvC2hw%2FUQBsIu4qWEigguKx0Uy7sXtJ%2B2Jfs0zDA%2BK7CTerQCRPTROqBdCCiOdfRCgPqLUCXemdyRAzeczTcpNTdpXauGfOkNJ6KHVY5%2FY09TVSq102bUbftBFgByWE7UsF2r5%2B9wkU6no%2BZNow%2Fp3pVwN1kDPg38cwh7N%2FmSl9lmY6HCDoSg4eMNN%2BQmazx%2FIqbN3ZBq25mrw%2FgcVwa06G4pUSimRudimm27NvR%2BhmmpP6P1nL8Oocg2h7dtd81a2uvOKlDTc9i0xQOQ72m%2B0BJ9usM%2FSYn8im6hlNRVUqHP9KUAHNA8M3OmxDUMd%2BFlbvXw%2BhebNec2X3YukjOFf9slwx51UFtNkpLY14yoTfo8KWMPrpuqYGOrEBnFn75ytjlhdJUm%2B2F2%2FnLw2c2oExCFxhY6wJYTuFo0fOGqskQ%2FKpC6QmAjFxK5WuIUygh4MYO6okprx5OL6DpvvltopOBCXfp5n4iqqpq3YaEHNkF%2FETQX7y8lmUZZBNOgzpm0Vc0RFDCjPJheGiFlK6BW5DoD7AHeSmkB44ijcmkOxGObHxyIwdXHbEwFFvRrmhAZuYiYiP79csTswHWMQxHyK4UmPcbGuqeXPR9pgw&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230805T215946Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFD7JPI2QV%2F20230805%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6d3a02633da4b82c87d98510417a7af8c30da75b0a665ff9810564f1b18c5ff7"
    end

    it 'consumes contry api for country name' do
      country_list = File.read('spec/fixtures/countries/all_countries.json')
      stub_request(:get, "https://restcountries.com/v3.1/all")
      .to_return(status: 200, body: country_list)

      recipes_random_country = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france&type=public")
      .to_return(status: 200, body: recipes_random_country)

      country = Country.new("France")
      allow_any_instance_of(CountrySearch).to receive(:get_country).and_return("france")
      get '/api/v1/recipes', params: {country: ''}, headers: { 'Accept' => 'application/json' }
      recipes = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(recipes.count).to eq 20
      expect(recipes.first[:id]).to eq "null"
      expect(recipes.first[:type]).to eq "recipe"
      expect(recipes.first[:attributes][:title]).to eq "Herb And White Wine Granita"
      expect(recipes.first[:attributes][:url]).to eq "http://www.food52.com/recipes/351_herb_and_white_wine_granita"
      expect(recipes.first[:attributes][:country]).to eq "france"
      expect(recipes.first[:attributes][:image]).to eq "https://edamam-product-images.s3.amazonaws.com/web-img/88a/88a8388d0f4efdb31fc25dbd975d9b5e.JPG?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIFl89Z4eip7kAAmCtSs7ESobDuWN6%2F8ukb7uR7lMV17RAiEAyYrA7qYxUcZIw5b4Ws%2BbLn0Vf7HvJ2mYGiP26BnNzV8quQUIThAAGgwxODcwMTcxNTA5ODYiDGx2pdYBQEvjUOoIuSqWBSoCWMhEsJ1GJJbSQQtF2NCb6%2BQ%2BpKZP8XMCKBw2UELAhEcgQQ4pVS0rrGQLfnDcvpIpDH6Dm8YFjygreoVta%2FVn%2BLvlC2vVizv9ev%2FMwEdg9IQM2nzP2cy7%2FyWImWTwJVtEd2XtJHiVwT493bRirJ2EQFEFlEnzq%2FE3EPXzamHPZjPTYOvVG8acmLfYqRVDnKI3bc%2F7Shjxhd%2BH8RS5Pb0qbFEaOWTCebqphLikGny3x82qK2AUhiYtQi5xNeftwpmIvx6NiQp67Ve7qyJJ8I8azP8OBE%2FkkGFyJVtETc5sSNuD7jtTo7hCixADBzHSiYBS8gjbn4Iy8t1CwsDRPvBZc0o6BsQWrHKPDaVeByMFV2Ci5K1Tfl%2BotBKw%2Fiig1xIJ8yH1Ace3oCSwTniacXvbfphFAzoxuuirJSc0aLDbzlbfEh5bm0XhGnDOxDr%2BNNJ04UKoaveTL1gS9HFC51TZQHmJrsMDFdTUm8OuQs%2FK9eVAwgkEL0kpohokp7gkNRB1DyvC2hw%2FUQBsIu4qWEigguKx0Uy7sXtJ%2B2Jfs0zDA%2BK7CTerQCRPTROqBdCCiOdfRCgPqLUCXemdyRAzeczTcpNTdpXauGfOkNJ6KHVY5%2FY09TVSq102bUbftBFgByWE7UsF2r5%2B9wkU6no%2BZNow%2Fp3pVwN1kDPg38cwh7N%2FmSl9lmY6HCDoSg4eMNN%2BQmazx%2FIqbN3ZBq25mrw%2FgcVwa06G4pUSimRudimm27NvR%2BhmmpP6P1nL8Oocg2h7dtd81a2uvOKlDTc9i0xQOQ72m%2B0BJ9usM%2FSYn8im6hlNRVUqHP9KUAHNA8M3OmxDUMd%2BFlbvXw%2BhebNec2X3YukjOFf9slwx51UFtNkpLY14yoTfo8KWMPrpuqYGOrEBnFn75ytjlhdJUm%2B2F2%2FnLw2c2oExCFxhY6wJYTuFo0fOGqskQ%2FKpC6QmAjFxK5WuIUygh4MYO6okprx5OL6DpvvltopOBCXfp5n4iqqpq3YaEHNkF%2FETQX7y8lmUZZBNOgzpm0Vc0RFDCjPJheGiFlK6BW5DoD7AHeSmkB44ijcmkOxGObHxyIwdXHbEwFFvRrmhAZuYiYiP79csTswHWMQxHyK4UmPcbGuqeXPR9pgw&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230805T215946Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFD7JPI2QV%2F20230805%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6d3a02633da4b82c87d98510417a7af8c30da75b0a665ff9810564f1b18c5ff7"
    end

    it 'returns empty array if no recipes found' do
      data = {
        []
      }
    end
  end
end