require 'rails_helper'

def client_id
  Doorkeeper::Application.find_by(name: 'Web Client').uid
end

def client_secret
  Doorkeeper::Application.find_by(name: 'Web Client').secret
end

def generate_refresh_token
  loop do
    # generate a random token string and return it

    # unless there is already another token with the same string

    token = SecureRandom.hex(32)

    break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
  end
end

def generate_access_token(user)
  client_app = Doorkeeper::Application.find_by(name: 'Web Client')

  Doorkeeper::AccessToken.create(
    resource_owner_id: user.id,
    application_id: client_app.id,
    refresh_token: generate_refresh_token,
    expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
    scopes: ''
  ).token
end

RSpec.configure do |config| # rubocop:disable Metrics/BlockLength
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s
  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'BLOG API V1',
        version: 'v1'
      },
      components: {
        securitySchemes: {
          bearer_auth: {
            type: :http,
            scheme: :bearer
          }
        },
        schemas: {
          user: {
            type: :object,
            properties: {
              id: { type: :integer, example: '2' },
              name: { type: :string, example: 'Scott Wells' },
              photo: { type: :string, example: 'https://randomuser.me/api/portraits/men/46.jpg' },
              bio: { type: :string,
                     example: 'Lorem ipsum dolor' },
              posts_count: { type: :integer, example: '3' },
              email: { type: :string, example: 'scott_wells@test.com' }
            },
            required: %w[id name photo bio posts_count email]
          },
          post: {
            type: :object,
            properties: {
              id: { type: :integer, example: '3' },
              title: { type: :string, example: 'Donec commodo magna vel tortor cursus.' },
              text: { type: :string,
                      example: 'Lorem ipsum dolor' },
              comments_counter: { type: :integer, example: '11' },
              likes_counter: { type: :integer, example: '0' }
            },
            required: %w[id title text comments_counter likes_counter]
          },
          comment: {
            type: :object,
            properties: {
              id: { type: :integer, example: '11' },
              text: { type: :string, example: 'THANKS EVERYONE' },
              users_id: { type: :integer, example: '11' }
            },
            required: %w[id text users_id]
          },
          ErrorResponse: {
            type: :object,
            properties: {
              type: :array,
              items: { type: :string }
            }
          }
        }
      }
    }
  }
  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
