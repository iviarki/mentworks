package 'httpd-devel'

cookbook_file '/usr/local/src/mod_antiloris.c' do
	source 'mod_antiloris.c'
end

execute "LoadModule" do
     command "echo \"#LoadModule foo_module /usr/lib/apache2/modules/foo.so\" >> #{node[:apache][:dir]}/conf/httpd.conf"
end

execute "Install mod_antiloris" do
	cwd "/usr/local/src"
	command "apxs -a -i -c mod_antiloris.c"
end

execute "Make module available" do
	command "echo \"LoadModule mod_antiloris /usr/lib64/httpd/modules/mod_antiloris.so\" >> #{node[:apache][:dir]}/mods-available/mod_antiloris.load"
end

apache_module "mod_antiloris" do
  enable true
end

execute "Restart Apache" do
    command "service httpd restart"
end
