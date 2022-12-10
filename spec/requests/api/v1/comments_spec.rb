require 'swagger_helper'

describe "User's Post's Commnets", swagger_doc: 'v1/swagger.yaml' do
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

  let!(:comment) { Comment.includes(:author, post: [:author]).first }

  let!(:post_id) { comment.post.id }

  let!(:user_id) { comment.post.author.id }

  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get "List comments" do
      consumes 'application/json'
      produces 'application/json'

      security [{ bearer_auth: [] }]
      parameter name: :user_id, in: :path, type: :integer
      parameter name: :post_id, in: :path, type: :integer

      response 401, 'Unauthorized' do
        let(:Authorization) { '' }

        run_test!
      end

      response 200, 'OK' do
        schema type: :array, items: { '$ref' => '#/components/schemas/comment' }

        let(:Authorization) { "Bearer #{generate_access_token(test_person)}" }

        run_test!
      end
    end

		post "post a comment" do
			consumes 'application/json'
			produces 'application/json'

			security [{ bearer_auth: [] }]
			parameter name: :user_id, in: :path, type: :integer
			parameter name: :post_id, in: :path, type: :integer
			parameter name: :text, in: :body, schema: {
				type: :object,
				properties: {
					text: { type: :string, example: 'some comment' },
				},
				required: [ 'text' ]
			}

			response 401, 'Unauthorized' do
				let(:Authorization) { '' }
				let(:text) {({text: 'test comment'})}

				run_test!
			end

			response 200, 'OK' do
				schema '$ref' => '#/components/schemas/comment'

				let(:Authorization) { "Bearer #{generate_access_token(test_person)}" }
				let(:text) {({text: 'test comment'})}

				run_test!
			end

		end
  end
end
