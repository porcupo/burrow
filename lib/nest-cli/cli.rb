require 'thor'
require 'nest_thermostat'
require 'thor'
require 'formatador'
require 'pp'
require 'ap'

NEST_EMAIL = 'nest@qpine.net'
NEST_PASSW = 'n00dles'

module Nest
  class CLI < Thor
    desc "show", "Display status"
    def show
      @nest = NestThermostat::Nest.new({
                                         email: NEST_EMAIL,
                                         password: NEST_PASSW
                                       })
      nest_table = [
                    { :setting => 'Current temp', :value => @nest.current_temperature },
                    { :setting => 'Set temp', :value => @nest.temperature },
                    { :setting => 'Target temp at', :value => @nest.target_temperature_at.to_s },
                    { :setting => 'Away?', :value => @nest.away.to_s },
                    { :setting => 'Leaf?', :value => @nest.leaf.to_s },
                    { :setting => 'Humidity', :value => @nest.humidity },
                   ]
      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(nest_table)
      }
    end
    desc "temp TARGET", "Set temperature"
    def temp(target_temp)
      @nest = NestThermostat::Nest.new({ email: NEST_EMAIL, password: NEST_PASSW })
      p_temp = @nest.temperature
      @nest.temperature = target_temp

      nest_table = [{ :setting => 'Previous target', :value => p_temp },
                    { :setting => 'Current Target', :value => @nest.temperature }]

      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(nest_table)
      }
    end

    desc "away", "Set away"
    def away
      @nest = NestThermostat::Nest.new({email: NEST_EMAIL, password: NEST_PASSW})
      p_away = @nest.away
      @nest.away = true
      nest_table = [{ :setting => 'Was away?', :value => p_away.to_s},
                    { :setting => 'Is away?', :value => @nest.away.to_s}] 
      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(nest_table)
      }
    end

    desc "home", "Set home"
    def home
      @nest = NestThermostat::Nest.new({email: NEST_EMAIL, password: NEST_PASSW})
      p_away = @nest.away
      @nest.away = false
      nest_table = [{ :setting => 'Was away?', :value => p_away.to_s},
                    { :setting => 'Is away?', :value => @nest.away.to_s}] 
      formatador = Formatador.new
      formatador.indent {
        formatador.display_table(nest_table)
      }
    end

    desc "dump", "Dump status"
    def dump
      @nest = NestThermostat::Nest.new({ email: NEST_EMAIL, password: NEST_PASSW })
      ap @nest.status
    end
  end
end
