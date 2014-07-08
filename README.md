#My dotfiles

##Installation

I currently support installation via two methods: _boxen_ and _by hand_

###With boxen

####Add dotfiles repo to your peope file

__File__: /opt/boxen/repo/modules/people/manifests/<your-user-name>.pp

__Contents__:

```
class people::<your-user-name> {
  ...

  $home     = "/Users/${::boxen_user}"
  $src       = "${home}/src"
  $dotfiles = "${my}/dotfiles"

  file { $src:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'otternq/dotfiles',
    require => File[$src]
  }
  ...
}
```

__Run Boxen__: `boxen`


__Run bootstrapper after project is installed__

```
cd ~/src/dotfiles
ruby bootstrap.rb
```

###By Hand

```
cd ~/src
git clone https://github.com/otternq/dotfiles
cd dotfiles
ruby bootstrap.rb
```
##Whats included

I'm going to list the tools/crap and default settings I try to install

###Software

- zsh (oh-my-zsh)
- HomeBrew (with a couple packages)
    - wget

###Configs

- set up git user.name and user.email (you will be prompted)
- depending on your shell, I prep a bash_profile or zshrc
- i link up a vimrc file, for nice auto indent, soft tabs, etc
