package "iptables" 

template "/usr/sbin/myiptables" do
  source "iptables_ruleset.erb"
  mode 0755
  variables :theworkip => node[:workip]
end

execute "rebuild-iptables" do
  command "/usr/sbin/myiptables"
  action :nothing
end
