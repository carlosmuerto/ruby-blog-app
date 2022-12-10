require 'rails_helper'

def get_client_id
  Doorkeeper::Application.find_by(name: 'Web Client').uid
end

def get_client_secret
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

RSpec.configure do |config|
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
            scheme: :bearer,
          }
        },
        schemas: {
          User: {
            type: :object,
            properties: {
              id: { type: :integer, example: '2' },
              name: { type: :string, example: 'Scott Wells' },
              photo: { type: :string, example: 'https://randomuser.me/api/portraits/men/46.jpg' },
              bio: { type: :string,
                     example: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras posuere, diam eu tempor gravida, tellus nibh accumsan ligula, at efficitur neque nibh at tellus. Nullam ante ex, lobortis sit amet odio ac, fermentum cursus est. Quisque ornare dapibus metus in eleifend. Ut luctus erat eget mauris egestas porta. Suspendisse potenti. Curabitur malesuada nunc ex, ac tincidunt purus eleifend nec. Nunc nisi orci, bibendum sit amet orci ac, tempus tristique libero. Proin tempor convallis lectus, sed fringilla ex finibus vulputate.' },
              posts_count: { type: :integer, example: '3' },
              email: { type: :string, example: 'scott_wells@test.com' }
            }
          },
          post: {
            type: :object,
            properties: {
              id: { type: :integer, example: '3' },
              title: { type: :string, example: 'Donec commodo magna vel tortor cursus.' },
              text: { type: :string,
                      example: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a urna fringilla, cursus elit non, sagittis quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed et urna vel ante ultrices volutpat et sed risus. Aenean vestibulum urna a metus vestibulum, sit amet ornare dui mollis. Pellentesque tincidunt congue lorem quis scelerisque. Aenean pellentesque ornare justo sed molestie. Vestibulum sagittis eget tortor tincidunt cursus. Nunc ac scelerisque nulla. Aliquam molestie laoreet consectetur. Integer viverra nunc at diam accumsan vehicula.\nPraesent porta, urna eu consectetur tempor, enim metus porttitor nibh, non hendrerit orci dui eu ligula. Maecenas posuere lorem nec mollis iaculis. Suspendisse in lorem urna. Nullam sollicitudin erat et eleifend tristique. Duis in libero orci. Aliquam quis convallis erat, non cursus erat. Morbi non massa nec orci mollis efficitur. Nunc varius nulla sed nisl ultrices dictum. Nullam lacinia nisl ac lacinia laoreet. Praesent venenatis sapien ut risus ultricies, ac fringilla odio tincidunt. Aliquam nec pretium augue. Nulla laoreet mattis mauris, a mattis dui feugiat sed. Aliquam eros dolor, feugiat sit amet maximus et, aliquet viverra mi. Suspendisse potenti. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\nQuisque consectetur quam placerat enim lacinia, ac commodo lorem rhoncus. Cras enim elit, egestas at commodo nec, molestie sed ante. Morbi at venenatis ipsum. Pellentesque varius ac urna quis mattis. Cras accumsan libero a dui sodales condimentum. Cras placerat lacus ut nunc condimentum, sit amet laoreet augue suscipit. Duis sed eleifend neque, et lobortis orci.' },
              comments_counter: { type: :integer, example: '11' },
              likes_counter: { type: :integer, example: '0' }
            }
          },
          comment: {
            type: :object,
            properties: {
              id: { type: :integer, example: '11' },
              text: { type: :string, example: 'THANKS EVERYONE' },
              author: { '$ref' => '#/definitions/User' }
            }
          },
          ErrorResponse: {
            type: :object,
            properties: {
              type: :array,
              items: { type: :string }
            }
          }
        }
      },
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
