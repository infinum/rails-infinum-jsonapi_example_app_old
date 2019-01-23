module Docs
  module Api
    module V1
      module Sessions
        extend Dox::DSL::Syntax

        document :api do
          resource 'Sessions' do
            endpoint '/sessions'
            group 'Auth'
          end
        end

        document :create do
          action 'Create session'
        end

        document :delete do
          action 'Delete session'
        end
      end
    end
  end
end
