# frozen_string_literal: true

require 'swagger_helper'
describe 'Car API' do
  path '/api/v1/cars' do
    post 'Creates a car' do
      tags 'Cars'
      consumes 'application/json', 'application/xml'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          model: { type: :string },
          release_year: { type: :integer },
          color: { type: :string },
          transmission: { type: :string },
          price: { type: :integer },
          seats: { type: :integer },
          wheel_drive: { type: :string },
          image_link: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[id brand model release_year color transmission seats wheel_drive price user_id]
      }
      response '201', 'Car created' do
        let(:car) do
          { brand: 'mercedes', image_link: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
r-2.jpeg?isig=0&q=80", model: 'benz', release_year: 1999, color: 'black', transmission: 'manual', seats: 6,
            wheel_drive: 'four-wheel', price: 20_000, user_id: 1 }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:car) { { name: 'foo' } }
        run_test!
      end
    end
  end
  path '/api/v1/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Cars'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 brand: { type: :string },
                 model: { type: :string },
                 release_year: { type: :integer },
                 color: { type: :string },
                 transmission: { type: :string },
                 price: { type: :integer },
                 seats: { type: :integer },
                 wheel_drive: { type: :string },
                 image_link: { type: :string },
                 user_id: { type: :integer }
               },
               required: %w[id brand model release_year color transmission seats wheel_drive price user_id]
        let(:id) do
          Car.create(brand: 'mercedes', image_link: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
          r-2.jpeg?isig=0&q=80", model: 'benz', release_year: 1999, color: 'black', transmission: 'manual',
                     seats: 6, wheel_drive: 'four-wheel', price: 20_000, user_id: 1).id
        end
        run_test!
      end
      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    delete 'Deletes a car' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '204', 'event deleted' do
        let(:id) do
          Event.create(
            id: 1,
            brand: 'vox',
            model: 'wagen',
            release_year: 2007,
            color: 'grey',
            transmission: 'manual',
            price: 20_000,
            seats: 4,
            wheel_drive: 'front',
            image_link: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
          r-2.jpeg?isig=0&q=80",
            user_id: 1
          ).id
        end
        let(:user_id) do
          User.create(username: 'User').id
        end
        run_test!
      end
    end
  end

  path '/api/v1/cars' do
    get 'Retrieves all cars' do
      tags 'Cars'
      produces 'application/json'
      response '200', 'car found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 brand: { type: :string },
                 model: { type: :string },
                 release_year: { type: :integer },
                 color: { type: :string },
                 transmission: { type: :string },
                 price: { type: :integer },
                 seats: { type: :integer },
                 wheel_drive: { type: :string },
                 image_link: { type: :string },
                 user_id: { type: :integer }
               },
               required: %w[id brand model release_year color transmission seats wheel_drive price user_id]

        let(:user_id) do
          User.create(username: 'User').id
        end
        run_test!
      end

      response '404', 'car not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end
end
