module Burrow
  class Config
    attr_reader :email, :password
    def initialize(file)
    @email = YAML.load_file(file)[:email]
    @password = YAML.load_file(file)[:password]
  end
end
