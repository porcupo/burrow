module Burrow
  module_function
  def config
    file = "#{ENV['HOME']}/.burrow.yaml"
    begin
      email = YAML.load_file(file)[:email]
      password = YAML.load_file(file)[:password]
    rescue Exception => e
      puts "#{file} does not exist!"
      p e
      abort
    end
    return {email: email, password: password}
  end
end
