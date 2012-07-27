lc-listcommands-bash
====================

A bash script for providing a "list commands previously used in this directory" command.

### The Problem and Solution

I can never remember the exact commands I need to run whenever I'm in certain directories.  Things like `virtualenv/bin/activate`, `apache/bin/restart`, `./manage.py runserver`, `git clone git@github.com:obscure-git-repository.git` and hundreds of other miscellaneous commands that I do during development and sysadmining.  I could look in my bash\_history, but it would list all commands and not filter it by my current directory.

I routintely type '`ls`' when I enter directories, and I wished I could do something like '`lc`' for "list commands I've used in this directory".  Finally, at the Seattle beer&&code meetup, a small script was born.

### Usage

**Do some commands:**

	$ cd lc-listcommands-bash/
	$ ls
	$ vim README.md
	$ git status
	$ git add listcommands.sh README.md
	$ git status

**List commands** previously executed in that directory, without duplicates:

	$ lc
	List commands run in /Users/peterconerly/code/lc-listcommands-bash
	ls
	vim README.md
	git status
	git add listcommands.sh


### Installation

In your .bashrc or .bash_profile, add the line:

	source /path/to/listcommands.sh

and reload your shell.

### How does it work?

listcommands.sh uses `PROMPT_COMMAND` to make a seperate `~/.lc_history file`, which records any new commands and what location it's in.  The custom history in `PROMPT_COMMAND` was inspired by [this stackoverflow answer](http://stackoverflow.com/a/948515/564872) by Dennis Williamson.

If you are already using `PROMPT_COMMAND` then this may not work for you.

Because listcommands.sh is recording a new history with location, the '`lc`' command will only populate commands you have executed after installing listcommands.sh.

listcommands.sh has been tested on OSX 10.7.4 with bash version: `GNU bash, version 3.2.48(1)-release (x86_64-apple-darwin11)`

### Upcoming Features

I'm all ears for suggestions on how to impliment these, or for other features that should be added.  I'm a bash scripting novice and could use all the advice I can get!

1. Limit `lc` to x most recent commands, such as:

		
		$ lc 2
		List 2 most recent command(s) run in /Users/peterconerly/code/lc-listcommands-bash
		git add listcommands.sh README.md
		git status
		

2. Allow users to cycle through recent commands used in their local directory, similar to how bash history works.  
Usage would be: `[Shift]` (or another meta key) `+ [Up]` to cycle to the most recent command.

3. Make listcommands.sh's `PROMPT_COMMAND` play nice with other custom `PROMPT_COMMAND`.

4. Add a 10k line limit to `~/.lc_history file`
