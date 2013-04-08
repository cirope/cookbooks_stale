package 'zsh'

user node[:user][:name] do
  password node[:user][:password]
  home "/home/#{node[:user][:name]}"
  shell '/bin/zsh'
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source 'zshrc.erb'
  owner node[:user][:name]
end
