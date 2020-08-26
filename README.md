# COVID Counter

A very quick project to see COVID stats in the states at a glance.

### Installation

Requires an installation of [sqlite3](https://www.tutorialspoint.com/sqlite/sqlite_installation.htm).

Requires `rake` to run. You can install `rake` from the terminal with `gem install rake`. You must first have a valid installation of ruby and bundler.

To install from the terminal, first navigate to the file directory and then run `rake install`.

### Usage

To get top level stats for the US, navigate to the directory and execute `bin/run`.

You can also run with arguments of state initials, for example `bin/run ny nj`, which would post information for New York and New Jersey.

The app will attempt to update the first time it's run each day. You can force an update with `update` as an argument (for example, `bin/run update`).
