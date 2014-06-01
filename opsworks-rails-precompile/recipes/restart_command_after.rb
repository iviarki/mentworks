  execute "restart Rails app for custom env after precompile" do
    cwd deploy[:current_path]
    command "../../shared/scripts/unicorn clean-restart"
    user deploy[:user]

    action :nothing
  end
