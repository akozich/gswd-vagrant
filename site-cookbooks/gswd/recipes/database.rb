include_recipe 'postgresql::server'

# Rewrite this resource to use our template instead
template "#{node[:postgresql][:dir]}/pg_hba.conf" do
  cookbook 'gswd'
end

# Create database user
puts "postgres password?"
puts node['postgresql']['password']['postgres']
puts node['postgresql']['config']['port']

postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user 'vagrant' do
  connection postgresql_connection_info
  action :create
  password 'vagrant'
end

postgresql_database 'microblog' do
  connection postgresql_connection_info
  owner 'vagrant'
  action :create
end
