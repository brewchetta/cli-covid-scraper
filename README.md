# COVID Counter

A very quick project to see COVID stats in the states at a glance.

### Installation

Requires an installation of [sqlite3](https://www.tutorialspoint.com/sqlite/sqlite_installation.htm).

Requires `rake` to run. You can install `rake` from the terminal with `gem install rake`. You must first have a valid installation of ruby and bundler.

To install from the terminal, first navigate to the file directory and then run `rake install`.

To install the shell command, run `rake shell_command` after installation. This will only work if your computer utilizes `bash` or `zshell`. To uninstall, remove the function starting with `covid()` from your `.bashrc` or `.zshrc` file. The shell command will not work if the covid counter is moved to a different directory.

### Usage

To get top level stats for the US, navigate to the directory and execute `bin/run`.

You can also run with arguments of state initials, for example `bin/run ny nj`, which would post information for New York and New Jersey.

The app will attempt to update the first time it's run each day. You can force an update with `update` as an argument (for example, `bin/run update`).

You can additionally display a general overview along with specific state data by including the `general` argument. For example, `bin/run general ny nj` would display an overview of the USA as well as specific information for NY and NJ.

If the shell command has been installed, the replace `bin/run` with `covid` to run the program (try `covid ny nj`). The shell command can be run from any directory.

### Credit

Thanks to the folks at https://coronavirusapi.com/ who have been updating daily with new data for COVID19.
