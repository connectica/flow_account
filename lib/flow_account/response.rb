module FlowAccount
  module Response
    def self.create(response_hash)
      result = response_hash.result.dup rescue response_hash
      result.extend(self)

      result
    end
  end
end
