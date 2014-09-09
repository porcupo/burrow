# burrow

Command-line tool to control your nest thermostat
Mostly just a learning project

This is based off the easy-to-use ericboehs/nest_thermostat gem.

## Setup
* Modify `burrow.yaml` and save it as `~/.burrow.yaml`

## Usage examples
```bash
>:3 burrow
Commands:
  cli.rb away            # Set away
  cli.rb dump            # Dump status
  cli.rb help [COMMAND]  # Describe available commands or one specific command
  cli.rb home            # Set home
  cli.rb show            # Display status
  cli.rb temp TARGET     # Set temperature
>:3
```

```bash
>:3 burrow show
    +----------------+---------------------------+
    | setting        | value                     |
    +----------------+---------------------------+
    | Current temp   | 76.262                    |
    +----------------+---------------------------+
    | Set temp       | 72.91                     |
    +----------------+---------------------------+
    | Target temp at | 2014-09-09 03:34:44 -0400 |
    +----------------+---------------------------+
    | Away?          | false                     |
    +----------------+---------------------------+
    | Leaf?          | false                     |
    +----------------+---------------------------+
    | Humidity       | 43                        |
    +----------------+---------------------------+
>:3
```

```bash
>:3 burrow home
    +-----------+-------+
    | setting   | value |
    +-----------+-------+
    | Was away? | false |
    +-----------+-------+
    | Is away?  | false |
    +-----------+-------+
>:3
```

```bash
>:3 burrow temp 70
    +-----------------+-------+
    | setting         | value |
    +-----------------+-------+
    | Previous target | 72.91 |
    +-----------------+-------+
    | Current Target  | 70.0  |
    +-----------------+-------+
>:3
```

## Todo
* Switch between cool/heat/cool+heat/off
* fan timer
* configuration

## License
* See LICENSE.txt for further details.

