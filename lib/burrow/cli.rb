require 'thor'
require 'nest_thermostat'
require 'formatador'
require 'ap'
require 'burrow/config'

module Burrow
  class CLI < Thor
    desc "show", "Display status"
    def show
      @burrow = NestThermostat::Nest.new({
                                         email: config[:email],
                                         password: config[:password]
                                       })
      burrow_table = [
                    { :setting => 'Current temp', :value => @burrow.current_temperature },
                    { :setting => 'Set temp', :value => @burrow.temperature },
                    { :setting => 'Target temp at', :value => @burrow.target_temperature_at.to_s },
                    { :setting => 'Away?', :value => @burrow.away.to_s },
                    { :setting => 'Leaf?', :value => @burrow.leaf.to_s },
                    { :setting => 'Humidity', :value => @burrow.humidity },
                   ]
      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(burrow_table)
      }
    end
    desc "temp TARGET", "Set temperature"
    def temp(target_temp)
      @burrow = NestThermostat::Nest.new({ email: config[:email], password: config[:password] })
      p_temp = @burrow.temperature
      @burrow.temperature = target_temp

      burrow_table = [{ :setting => 'Previous target', :value => p_temp },
                    { :setting => 'Current Target', :value => @burrow.temperature }]

      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(burrow_table)
      }
    end

    desc "away", "Set away"
    def away
      @burrow = NestThermostat::Nest.new({email: config[:email], password: config[:password]})
      p_away = @burrow.away
      @burrow.away = true
      burrow_table = [{ :setting => 'Was away?', :value => p_away.to_s},
                    { :setting => 'Is away?', :value => @burrow.away.to_s}] 
      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(burrow_table)
      }
    end

    desc "home", "Set home"
    def home
      @burrow = NestThermostat::Nest.new({email: config[:email], password: config[:password]})
      p_away = @burrow.away
      @burrow.away = false
      burrow_table = [{ :setting => 'Was away?', :value => p_away.to_s},
                    { :setting => 'Is away?', :value => @burrow.away.to_s}] 
      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(burrow_table)
      }
    end

    desc "dump", "Dump status"
    def dump
      @burrow = NestThermostat::Nest.new({ email: config[:email], password: config[:password] })
      ap @burrow.status
    end
  end
end
