require 'swagger_helper'

describe "User's Posts", swagger_doc: 'v1/swagger.yaml' do
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

  let!(:page) {}

  let!(:user) { User.first }

  path '/api/v1/users/{user_id}/posts/' do
    get "List of User's post" do
      consumes 'application/json'
      produces 'application/json'

      security [{ bearer_auth: [] }]
      parameter name: :user_id, in: :path, type: :integer

      response 401, 'Unauthorized' do
        let(:Authorization) { '' }

        let(:user_id) { user.id }

        run_test!
      end

      response 200, 'OK' do
        schema type: :array, items: { '$ref' => '#/components/schemas/post' }

        let(:Authorization) { "Bearer #{generate_access_token(test_person)}" }

        let(:user_id) { user.id }

        run_test!
      end
    end
  end
end
