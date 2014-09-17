require 'nest_thermostat'

module Burrow
  # manages the away/home settings of the Nest
  class Away
    def initialize(config = {})
      @burrow = NestThermostat::Nest.new({ email: config[:email], password: config[:password]})
    end

    # Set the thermostat as 'Away'
    # Retuns array with previous and current away settings
    def yes
      previous_away = @burrow.away
      @burrow.away = true
      return [ previous_away, @burrow.away ]
    end

    # Unset 'Away' status
    # Not the DRYest thing ever
    def no
      previous_away = @burrow.away
      @burrow.away = true
      return [ previous_away, @burrow.away ]
    end
  end
end
