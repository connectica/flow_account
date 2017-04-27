module FlowAccount
  module Response
    def self.create(response_hash)
      data = response_hash.data.dup rescue response_hash
      data.extend(self)
      
      data
    end
  end
end
