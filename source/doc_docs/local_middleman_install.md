INSTALLING MIDDLEMAN FOR KOS_DOC
================================


**Caveats**:  The Middleman doc sytem is designed to always try to locally check things into your
local github *master* branch, then build the HTML results and check THEM into the local *gh-pages* branch.
These two branch names are hardcoded in the system and can't be easily changed, which is why separate
forks are used for development and release versions of the documentation.  If you use a separate branch
for your pull request, you will need to temporarily merge it into your own master branch in order
to test that your changes worked locally.


These instructions are written for a BASH shell on a UNIX-like machine.
However, the Windows instructions for use with Powershell should be similar.

### Set up ruby to contain the things you need locally on your machine 

Middleman uses the web-based Ruby language framework, and therefore Ruby has to
be installed first.


Download and install RVM from *https://rvm.io/* (It's a package for keeping a Ruby installation updated and for giving yourself a local user-land version of Ruby that doesn't require root privileges)

Make sure your $PATH is set up to prefer finding the RVM version of Ruby before any system versions.  Many versions of UNIX come with a Ruby installation by default, but it might not be up to date for Middleman.

Run:

    rvm install 2.1

This ensure a version of Ruby new enough to handle Middleman's syntax is installed (any number higher than 1.9 should be okay). This will install the entire ruby environment.

Run:

    gem install rubygems-bundler

to get the 'bundle' command that the script depends on.

Get a local copy of the KOS_DOC_DEV (or KOS_DOC, depending on what you're editing)  git repository to your own machine in the usual git clone way, by making your own fork of it on github, then cloning that fork to your local computer.

*cd* to wherever that local repository is kept, in its starting head folder.

Run:

    bundle install

This should set up your local environment correctly to handle the doc generation from then on without having to re-do the above commands each time.

### Then each time you want to generate the docs locally to see whether or not your markdown edits worked right, do this:


**Local generation**

To just generate documentation locally without publishing it to your github origin fork, for the purpose of checking your markdown code and making sure it looks right, run this: This puts the output HTML files into the build/ subdirectory:

    cd to wherever that repository is kept, in its starting folder.
    bundle exec middleman build

**publish to your origin fork**

To actually publish the files remotely to your fork on github (also executes the build
instruction mentioned above):

    cd to wherever that repository is kept, in its starting folder.
    bundle exec rake publish

NOTE: The publish command will only work with committed files. If you edit a local file and don't git commit it first, then the rake publish script won't use the change.

NOTE2:  The publish command will push the changes to the gh-pages branch of the github fork, but
infuruatingly NOT push the source changes to the master branch of the github fork.  **You still
need to manually perform the git push command to commit to source to master.**

NOTE3: Even though it doesn't actually push the source changes to master, it still requires that you have those changes locally committed anyway or it will give the error message "repository not clean".

### To view the outputted files

**LOCALLY**

To view the output HTML files locally, with FILE URLS, point your browser at the "build/" subfolder.

**HOSTED**

TO view the output HTML hosted on your fork, if you did a *bundle exec rake publish*, you should be able to click the link in the README.md that github renders on your fork.

