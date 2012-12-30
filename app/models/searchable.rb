module Searchable
  module ClassMethods
    def search(search)
      if search
        search_query(search)
      else
        scoped
      end
    end

    def search_query(search)
      where('name LIKE ?', "%#{search}%")
    end
  end

  def self.included(reciever)
    reciever.extend ClassMethods
  end
end
