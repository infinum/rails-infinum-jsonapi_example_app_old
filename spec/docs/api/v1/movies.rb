module Docs
  module Api
    module V1
      module Movies
        extend Dox::DSL::Syntax

        document :api do
          resource 'Movies' do
            endpoint '/movies'
            group 'Movies'
          end
        end

        document :index do
          action 'List movies'
        end
      end
    end
  end
end
