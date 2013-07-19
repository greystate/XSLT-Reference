# How to contribute to this project

Here's how I usually do when contributing to other people's projects, so it'll work for my own projects too:

* Fork the project
* Add the original project as the *upstream remote*
	
		git remote add upstream <original project .git URL>
	
* Create a feature branch, e.g.:

		git checkout -b add-missing-number-format-element

* Edit the code
* Commit locally
* Sync your fork's master with the upstream master:

		git checkout master
		git fetch upstream
		git rebase upstream/master
	
* Create a pull-request
