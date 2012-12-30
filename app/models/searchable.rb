module Searchable
  module ClassMethods
    def search(search)
      if search
        where(self.search_query, "%#{search}%")
      else
        scoped
      end
    end

    def search_query
      'name LIKE ?'
    end
  end

  def self.included(reciever)
    reciever.extend ClassMethods
  end
end
