package 'httpd-devel'
cookbook_file '/usr/local/src/mod_antiloris.c' do
	source 'mod_antiloris.c'
end
execute "Install mod_antiloris" do
	cwd "/usr/local/src"
	command "apxs -a -i -c mod_antiloris.c"
end
