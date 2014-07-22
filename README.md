# Environment Variables

Environment variables are "a set of dynamic named values that can affect the way running processes will behave on a computer".
We have seen environment variables on our projects when we type commands like `RACK_ENV=test rake db:migrate`.
Let's see if we can break down that definition and figure out what it means...

## Goals of this warmup

The main goals of this warmup are the ability to:

- access environment variables in a Ruby program
- write Ruby code that behaves differently depending on the value of a certain environment variable
- understand how `rake db:migrate` is different than `RACK_ENV=test rake db:migrate`

## Named Values

Open a Terminal and type `env` and you'll see something similar to this:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → env
    GREP_COLOR=1;33
    rvm_bin_path=/Users/lemonofpink/.rvm/bin
    TERM_PROGRAM=iTerm.app
    COMP_WORDBREAKS=
    "'@><=;|&(
    GEM_HOME=/Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool
    NGINX_PATH=/opt/nginx
    SHELL=/bin/bash
    ...

These are the environment variables that are set in your terminal process. Each variable has a name and a value.
Some of these variables should be familiar, like PATH:

    ± |master ✗| → env | grep PATH
    PATH=/Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool/bin:/Users/lemonofpink/.rvm/gems/ruby-2.1.1@global/bin:/Users/lemonofpink/.rvm/rubies/ruby-2.1.1/bin:/Users/lemonofpink/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/lemonofpink/.gem/ruby/1.8/bin:/opt/nginx/sbin
    GEM_PATH=/Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool:/Users/lemonofpink/.rvm/gems/ruby-2.1.1@global

The PATH environment variable, as you may remember, stores a list of directories that your
computer should look in to find other programs.

You can look at the value of a single environment variable from the command line using `echo $<VARIABLE_NAME>`. EX: echo $SHELL
Check out the example below:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → echo $PATH
    /Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool/bin:/Users/lemonofpink/.rvm/gems/ruby-2.1.1@global/bin:/Users/lemonofpink/.rvm/rubies/ruby-2.1.1/bin:/Users/lemonofpink/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/lemonofpink/.gem/ruby/1.8/bin:/opt/nginx/sbin

Try to print out the value of the USER and SHELL environment variables. What is the SHELL environment variable?

## Dynamic

Environment variables are dynamic in that their value can be changed, and new ones can be created. Try this:

You can use the `export` command to set the value of an environment variable. Here is
and example of setting a custom environment variable:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/sinatra-crud-reference
    ± |master ✓| → export FAVORITE_FOOD=lasagna

This sets the value of the FAVORITE_FOOD environment variable. You can look at the value like this:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/sinatra-crud-reference
    ± |master ✓| → echo $FAVORITE_FOOD
    lasagna

Notice that "lasagna" was printed out to the terminal.

Try setting some custom environment variables and printing them out.

## Accessing environment variables with Ruby

In Ruby, you have access to the environment variables that are set with the `ENV` hash.

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → ruby -e "puts ENV.inspect"
    {"GREP_COLOR"=>"1;33", "rvm_bin_path"=>"/Users/lemonofpink/.rvm/bin", "TERM_PROGRAM"=>"iTerm.app", "COMP_WORDBREAKS"=>" \t\n\"'@><=;|&(", "GEM_HOME"=>"/Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool", "NGINX_PATH"=>"/opt/nginx", "SHELL"=>"/bin/bash", "TERM"=>"xterm", "HISTSIZE"=>"5000", "IRBRC"=>"/Users/lemonofpink/.rvm/rubies/ruby-2.1.1/.irbrc", "TMPDIR"=>"/var/folders/t3/k1dmmdjs4mgblcx2ksjwhxwr0000gn/T/", "Apple_PubSub_Socket_Render"=>"/tmp/launch-vUke3I/Render", "GIT_HOSTING"=>"git@git.domain.com", "MY_RUBY_HOME"=>"/Users/lemonofpink/.rvm/rubies/ruby-2.1.1", "GIT_EDITOR"=>"vim", "USER"=>"lemonofpink", "_system_type"=>"Darwin", "BASH_IT_THEME"=>"bobby", "rvm_path"=>"/Users/lemonofpink/.rvm", "SSH_AUTH_SOCK"=>"/tmp/launch-ySDG9j/Listeners", "__CF_USER_TEXT_ENCODING"=>"0x1F5:0:0", "AUTOFEATURE"=>"true", "BASH_IT"=>"/Users/lemonofpink/.bash_it", "LSCOLORS"=>"Gxfxcxdxdxegedabagacad", "rvm_prefix"=>"/Users/lemonofpink", "__CHECKFIX1436934"=>"1", "PATH"=>"/Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool/bin:/Users/lemonofpink/.rvm/gems/ruby-2.1.1@global/bin:/Users/lemonofpink/.rvm/rubies/ruby-2.1.1/bin:/Users/lemonofpink/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/lemonofpink/.gem/ruby/1.8/bin:/opt/nginx/sbin", "PWD"=>"/Users/lemonofpink/gschool/dev/exercises/environment-variables", "EDITOR"=>"vim", "LANG"=>"en_US.UTF-8", "ITERM_PROFILE"=>"Default", "_system_arch"=>"x86_64", "_system_version"=>"10.9", "HISTCONTROL"=>"erasedups", "rvm_version"=>"1.25.26 (master)", "SHLVL"=>"1", "COLORFGBG"=>"7;0", "HOME"=>"/Users/lemonofpink", "GREP_OPTIONS"=>"--color=auto", "rvm_ruby_string"=>"ruby-2.1.1", "ITERM_SESSION_ID"=>"w0t1p1", "LOGNAME"=>"lemonofpink", "GEM_PATH"=>"/Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool:/Users/lemonofpink/.rvm/gems/ruby-2.1.1@global", "TODO"=>"t", "IRC_CLIENT"=>"irssi", "rvm_delete_flag"=>"0", "DISPLAY"=>"/tmp/launch-HCwwUw/org.macosforge.xquartz:0", "RUBY_VERSION"=>"ruby-2.1.1", "_system_name"=>"OSX", "FAVORITE_FOOD"=>"lasagna", "_"=>"/Users/lemonofpink/.rvm/rubies/ruby-2.1.1/bin/ruby", "OLDPWD"=>"/Users/lemonofpink/gschool/dev/exercises/sinatra-crud-reference"}

We see the same values as when we typed `env`, but in Ruby we have access to the environment
variables through the `ENV` hash. (-e let's you pass the ruby command a string of Ruby
code to be executed instead a file name).

To see which environment variables are available to us, we could print out the keys of the `ENV` hash:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → ruby -e "puts ENV.keys.sort"
    AUTOFEATURE
    Apple_PubSub_Socket_Render
    BASH_IT
    BASH_IT_THEME
    COLORFGBG
    COMP_WORDBREAKS
    DISPLAY
    EDITOR
    FAVORITE_FOOD
    GEM_HOME
    GEM_PATH
    ...

We can access specific environment variables just like we would with a hash:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → ruby -e "puts ENV['GEM_HOME']"
    /Users/lemonofpink/.rvm/gems/ruby-2.1.1@gschool

## How do environment variables get set in a Ruby program

The environment variables that are accessible to a Ruby program are inherited
from the environment of the process that started the Ruby program.

Typing `env` at the command line shows you what environment variables are set
in the terminal process. When you run `ruby environment_variables.rb` from the
command line, the `ENV` hash has the same set of environment variables that the
terminal had.

## Changing environment variables with Ruby

You can also change environment variables with Ruby:

Edit environment_variables.rb:

    puts "Name is: #{ENV["NAME"]}"
    ENV["NAME"] = "Jeff"
    puts "Now name is: #{ENV["NAME"]}"

Ruby this program and pass it some other value as NAME:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → NAME=hunter ruby environment_variables.rb
    Name is: hunter
    Now name is: Jeff

As you can see, the second time ENV['NAME'] is printed, we see that value that was set by
the Ruby code.

## Affecting the way programs run

We can write Ruby programs that behave differently depending on the value of environment variables.

Edit environment_variables.rb so that it looks like this:

    puts ENV["WOULD_RISK_HIS_NECK_FOR_HIS_BROTHER_MAN"]

Run the file:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → ruby environment_variables.rb

We don't see anything because we are trying to access an environment variable that isn't set.

Trying running the same Ruby program, but setting the WOULD_RISK_HIS_NECK_FOR_HIS_BROTHER_MAN
environment variable:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → WOULD_RISK_HIS_NECK_FOR_HIS_BROTHER_MAN=shaft ruby environment_variables.rb
    shaft

Notice that WOULD_RISK_HIS_NECK_FOR_HIS_BROTHER_MAN=shaft causes the program to have access
to the environment variable, so when the program prints it, we see "shaft".

This is basically the same thing that happens when you type `RACK_ENV=test rake db:migrate`.
Some Ruby code runs, checks `ENV["RACK_ENV"]`, and decides to either migrate the development,
test, or production database.

Edit `environment_variables.rb` to do the following:

- Write a method that prints out "Migrate the [environment] database", where [environment] is
replaced by the value of the RACK_ENV environment variable.

- Write a method that prints out "FEED ME" if the HUNGRY environment variable is true and
prints out "NOT NOW" otherwise.

## Environment variables are per process

The last thing to understand about environment variables is that they are defined per process.

Edit environment_variables.rb to look the following:

    puts "Favorite color in parent starts as: #{ENV['FAVORITE_COLOR']}"

    fork do
      puts "Favorite color in child starts as: #{ENV['FAVORITE_COLOR']}"
      ENV["FAVORITE_COLOR"] = 'red'
      puts "Favorite color in child ends as: #{ENV['FAVORITE_COLOR']}"
    end

    puts "Favorite color in parent ends as: #{ENV['FAVORITE_COLOR']}"

The `fork` method creates a copy of the current process. More [here](http://en.wikipedia.org/wiki/Fork_(system_call)).
The original method is called the parent process and newly created process is called the child.

Here is what it looks like when we run that code:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/environment-variables
    ± |master ✗| → FAVORITE_COLOR=orange ruby environment_variables.rb
    Favorite color in parent starts as: orange
    Favorite color in parent ends as: orange
    Favorite color in child starts as: orange
    Favorite color in child ends as: red

Why does FAVORITE_COLOR start out equal to "orange" in the child process. Why doesn't changing the value of FAVORITE_COLOR
in the child process affect the it in the parent process?

## That's It!

So that is what "a set of dynamic named values that can affect the way running processes will behave on a computer" means :)
