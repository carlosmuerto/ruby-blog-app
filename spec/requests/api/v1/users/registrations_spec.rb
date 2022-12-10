require 'swagger_helper'

describe 'Blogs API', swagger_doc: 'v1/swagger.yaml' do
  let!(:test_person_pass) do
    'test_person_pass'
  end

  let!(:test_person) do
    let_p = User.new(
      name: 'test person name',
      bio: 'test person bio',
      email: 'test_person@email.com',
      password: test_person_pass
    )
    let_p.skip_confirmation!
    let_p.save

    let_p
  end

  let!(:cretentials) do
    {
      client_id:,
      client_secret:,
      grant_type: 'password',
      email: test_person.email,
      password: test_person_pass
    }
  end

  path '/api/v1/oauth/token' do # rubocop:disable Metrics/BlockLength
    post 'api_token' do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :cretentials, in: :body, schema: {
        type: :object,
        properties: {
          client_id: { type: :string, example: client_id },
          client_secret: { type: :string, example: client_secret },
          grant_type: { type: :string, example: 'password' },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[
          client_id
          client_secret
          grant_type
          email
          password
        ]
      }

      response 200, 'OK' do
        schema type: :object,
               properties: {
                 access_token: { type: :string, example: '<access_token>' },
                 token_type: { type: :string, example: '<token_type>' },
                 expires_in: { type: :number, example: 7200 },
                 refresh_token: { type: :string, example: '<refresh_token>' },
                 created_at: { type: :number, example: Time.now.to_i }
               }

        run_test!
      end
    end
  end
end
