require 'eee'

module EEE

  class TestHelper

    def eee_server(index = 0)
      Scenario.new Methods::Client.new, config['servers'][index]
    end

    def eee_user(name = nil, domain = 0, server = 0)
      name = config['default_user'] if name.nil?

      user_config = config['users'][name]
      server_config = config['servers'][name]
      user_config['username'] =
        "#{name.downcase}@#{server_config['domains'][domain]}"

      Entities::User[user_config]
    end

    def eee_user_password(name = nil)
      name = config['default_user'] if name.nil?

      config['users'][name]['password']
    end

    private

    def config
      YAML.load_file @config
    end

    public

    def initialize(config_filename)
      @config = config_filename
    end

  end

end
