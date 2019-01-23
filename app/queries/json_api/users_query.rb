module JsonApi
  class UsersQuery < BaseQuery
    def scope
      User
    end

    def default_sort
      [email: :asc]
    end
  end
end
