# execute with
# ruby bootstrap.rb

def main

  if !hasBoxen
    puts "You don't have boxen, so I'm going to install things"
    installAllTheThings
  else
    puts "You have boxen (well done)..."
    puts "I'm not going to install programs because it should be in your boxen config"
  end

  configAllTheThings

end

def getShell
  `echo $SHELL`.split('/').last.strip
end

def hasBoxen
  return system('which boxen')
end

def installZSH

  shell = getShell

  #see if zsh is installed
  if shell == "zsh" #zsh is installed
    puts "yay zsh is installed!"
  else

    #does the user want to install zsh?
    puts "Your current shell is #{shell}, do you want to install zsh? yes(y) or no(n)"
    shouldInstallZSH = gets.strip!

    if shouldInstallZSH.match(/^y(es)?$/)
      puts "atta kid! Installing zsh!"
    else
      puts "Well fine."
    end

  end

end

def installHomeBrew

  puts "Checking on homebrew, if its not installed...its going to be"
  isBrewInstalled = system('which brew || echo hi')

  return unless isBrewInstalled

  #install brew packages
  ["wget"].each do |package|

    #no need to install if the system already has it
    next if system("brew info #{package}")

    #attempt the install
    if system("brew install #{package}")
      puts "Installed #{package}"
    else
      puts "Couldn't install #{package}...moving on"
    end

  end

end

def installAllTheThings

  installZSH
  installHomeBrew

end

def configGit

  #make sure git is installed
  abort "git isn't installed...can't configure it" unless system("which git")

  puts "Whats your git user.name?"
  username = gets.strip!

  puts "Whats your git user.email?"
  useremail = gets.strip!

  `git config --global user.name "#{username}"`
  `git config --global user.email "#{useremail}"`

end

def configShellProfile

  shell = getShell

  case shell
  when "zsh"
    puts "your using zsh, I'm gonna link ~/.zshrc to #{Dir.pwd}/zshrc"
  when "bash"
    puts "your using bash, I'm gonna link ~/.bash_profile to #{Dir.pwd}/bash_profile"
  else
    puts "...I don't know how to handle #{shell}, maybe you can fork the project and set it up?"
  end

end

def configVim
  puts "and now for the editor! Linking ~/.vimrc with #{Dir.pwd}/vimrc"
end

def configAck
  puts "and now for ack! Linking ~/.ackrc with #{Dir.pwd}/ackrc"
  puts `ln -s #{Dir.pwd}/ackrc ~/.ackrc`
end

def configAllTheThings

  puts "Linking ~/bin with #{Dir.pwd}/bin"

  #configGit
  configShellProfile
  configVim
  configAck

end

if __FILE__ == $0
  main()
end
