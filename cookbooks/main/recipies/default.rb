package 'zsh'

user node[:user][:name] do
  password node[:user][:password]
  home "/home/#{node[:user][:name]}"
  shell '/bin/zsh'
end
