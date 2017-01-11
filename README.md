Before install
-------
```
#yum install epel-release.noarch
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum groupinstall "Development Tools"
yum install kernel-headers kernel-devel

for grunt compass:
yum install ruby-devel.x86_64
```

Install
-------
```
sudo mysql_secure_installation
```


Test mysql connection
```
mysql -uroot -p
```

Test nginx
```
curl -v http://127.0.0.1/
```

Check if php-fpm is running

```
sudo lsof -Pni4 | grep LISTEN | grep php
```

Restart php (here version 7.0)

```
sudo brew services restart homebrew/php/php70
```

Docker
------
The Docker Toolbox is installed by default. You can create a docker vm (comparable to boot2docker) with Docker Machine as followed:

```
# create docker VM in virtualbox
docker-machine create --driver virtualbox dev

# set env vars for docker
eval "$(docker-machine env dev)"

# get IP
docker-machine ip dev
```

You then can use docker as normal. E.g. start a Solr container

```
docker run --name foobar-solr --publish 8080:8080 sinso/solr-typo3
```


Xdebug
------

https://confluence.jetbrains.com/display/PhpStorm/Configure+Xdebug+Helper+for+Chrome+to+be+used+with+PhpStorm
https://confluence.jetbrains.com/display/PhpStorm/Browser+Debugging+Extensions
https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc


Flow Debug Proxy
----------------
https://github.com/dfeyer/flow-debugproxy
https://discuss.neos.io/t/how-to-debug-a-flow-application-with-xdebug-and-phpstorm/204/6

```
export GOPATH="${HOME}/go"
mkdir -p ${GOPATH}/src/github.com/dfeyer/flow-debugproxy
git clone https://github.com/dfeyer/flow-debugproxy.git ${GOPATH}/src/github.com/dfeyer/flow-debugproxy
cd ${GOPATH}/src/github.com/dfeyer/flow-debugproxy
go get
go build
```

```
${GOPATH}/src/github.com/dfeyer/flow-debugproxy/flow-debugproxy --xdebug 127.0.0.1:9000 --ide 127.0.0.1:9010 --vv
```

Selenium
--------



Build grunt & co.
-----------------
```
cd Packages/Sites/Vendor.Site/
npm install
bower install
grunt
```


Inspired by
-----------
* https://gist.githubusercontent.com/frdmn/7853158/raw/bash_aliases
* http://blog.frd.mn/install-nginx-php-fpm-mysql-and-phpmyadmin-on-os-x-mavericks-using-homebrew/
* https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew
* http://cmall.github.io/LocalHomePage/
* https://groups.google.com/forum/#!msg/ansible-project/OPCESPvMppg/lrLOqdo0frEJ


# Mac Development Ansible Playbook

This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in OS X are difficult to automate (notably, the Mac App Store and certain tools from Apple), so I still have some manual installation steps, but at least it's all documented here.

This is a work in progress, and is mostly a means for me to document my current Mac's setup. I'll be adding settings and packages to this set of playbooks over time.

*See also*:

  - [Battleschool](http://spencer.gibb.us/blog/2014/02/03/introducing-battleschool) is a more general solution than what I've built here. (It may be a better option if you don't want to fork this repo and hack it for your own workstation...).
  - [osxc](https://github.com/osxc) is another more general solution, set up so you can fork the [xc-custom](https://github.com/osxc/xc-custom) repo and get your own local environment bootstrapped quickly.
  - [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks) was the original inspiration for this repository, but this project has since been completely rewritten.

## Installation

  1. [Install Ansible](http://docs.ansible.com/intro_installation.html).
  2. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
  3. Clone this repository to your local drive.
  4. Run the command `$ ansible-galaxy install -r requirements.txt` inside this directory to install required Ansible roles.
  5. Run `ansible-playbook main.yml -i inventory --ask-sudo-pass` from the same directory as this README file.

## Included Applications / Configuration

Applications (installed with Homebrew Cask):

  - Adium
  - BetterTouchTool
  - Google Chrome
  - Dropbox
  - Firefox
  - Handbrake
  - Homebrew
  - Karabiner
  - LICEcap
  - MacVim
  - Menu Meters
  - nvALT
  - Sequel Pro (MySQL client)
  - Skype
  - Skitch
  - Seil
  - Sublime Text
  - TextMate
  - TimeMachineEditor
  - Tower (Git client)
  - Transmit (S/FTP client)
  - Vagrant (+ Vagrant Manager)
  - VirtualBox
  - VLC

Packages (installed with Homebrew):

  - ansible
  - autoconf
  - gettext
  - libevent
  - packer
  - python
  - sqlite
  - mysql
  - php56 (+ php56-xdebug)
  - ssh-copy-id
  - cowsay
  - ios-sim
  - readline
  - subversion
  - kdiff3
  - openssl
  - pv
  - drush
  - wget
  - brew-cask

My [dotfiles](https://github.com/geerlingguy/dotfiles) are also installed into the current user's home directory, including the `.osx` dotfile for configuring many aspects of Mac OS X for better performance and ease of use.

Finally, there are a few other preferences and settings added on for various apps and services.

## Future additions

### Things that still need to be done manually

It's my hope that I can get the rest of these things wrapped up into Ansible playbooks soon, but for now, these steps need to be completed manually (assuming you already have Xcode and Ansible installed, and have run this playbook).

  1. Set JJG-Term as the default Terminal theme (it's installed, but not set as default automatically).
  2. Install [Sublime Package Manager](http://sublime.wbond.net/installation).
  3. Install all the Mac App Store Apps (see below).
  4. Install all the apps that aren't yet in this setup (see below).
  5. Remap Caps Lock to Escape (keycode 53), using [Seil](https://pqrs.org/osx/karabiner/seil.html.en).
  6. Set trackpad tracking rate.
  7. Set mouse tracking rate.
  8. Configure extra Mail and/or Calendar accounts (e.g. Google, Exchange, etc.).

### Applications/packages to be added:

These are mostly direct download links, some are more difficult to install because of custom installers or other nonstandard install quirks:

  - [iShowU HD](http://downloads.shinywhitebox.com/iShowU_HD_Pro_2.3.7.dmg)

### Configuration to be added:

  - I have vim configuration in the repo, but I still need to add the actual installation:
    ```
    mkdir -p ~/.vim/autoload
    mkdir -p ~/.vim/bundle
    cd ~/.vim/autoload
    curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
    cd ~/.vim/bundle
    git clone git://github.com/scrooloose/nerdtree.git
    ```

### Apps only available via the App Store

I also use the following apps at least once or twice per week, but unfortunately, as the Mac App Store is not able to be controlled via CLI, or any other way I can find (so far), I have to manually install all of these apps from within the App Store application.

  - Tweetbot
  - RadarScope
  - Pixelmator
  - Quick Resizer
  - 1Password
  - DaisyDisk
  - Byword
  - Aperture
  - Pages
  - Keynote
  - Numbers

There are a couple other apps I'm leaving out of the list, like Microsoft Word, because I normally don't install them unless/until I need them.

## Testing the Playbook

Many people have asked me if I often wipe my entire workstation and start from scratch just to test changes to the playbook. Nope! Instead, I posted instructions for how I build a [Mac OS X VirtualBox VM](https://github.com/geerlingguy/mac-osx-virtualbox-vm), on which I can continually run and re-run this playbook to test changes and make sure things work correctly.

## Ansible for DevOps

Check out [Ansible for DevOps](http://www.ansiblefordevops.com/), which will teach you how to do some other amazing things with Ansible.

## Author

[Jeff Geerling](http://jeffgeerling.com/), 2014 (originally inspired by [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks)).
