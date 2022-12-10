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

	let!(:page) {}

  path '/api/v1/users' do
    get 'List of Users' do
      consumes 'application/json'
			produces 'application/json'

      security [{ bearer_auth: [] }]
			parameter name: :page, in: :query, type: :number, required: false

      response 401, 'Unauthorized' do
        let(:Authorization) { 'AIMHEAR' }

        run_test!
      end

      response 200, 'OK' do
				schema type: :array, items: { '$ref' => '#/components/schemas/User' }

				let(:Authorization) { "Bearer #{generate_access_token(test_person)}" }

				run_test!
      end
    end
  end

  # path '/api/v1/users/{id}' do
  #   get 'Unauthorized'  do
  # 		parameter name: :id, in: :path, type: :integer
  # 		response 401, 'Unauthorized' do
  # 			let(:id) { '1' }
  # 			run_test!
  # 		end
  #   end

  # 	get '' do

  # 	end
  # end
end
