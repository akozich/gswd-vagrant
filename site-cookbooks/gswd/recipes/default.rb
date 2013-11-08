include_recipe "python::pip"
include_recipe "python::virtualenv"

# create a 2.6 virtualenv owned by vagrant user
python_virtualenv "/home/vagrant/blog-venv" do
  owner "vagrant"
  group "vagrant"
  action :create
end

# install latest django into virtualenv
python_pip "django" do
  virtualenv "/home/vagrant/blog-venv"
end

# install psycopg2 suggested by heroku
python_pip "psycopg2" do
  virtualenv "/home/vagrant/blog-venv"
end

# install dj-database-ur suggested by heroku
python_pip "dj-database-url" do
  virtualenv "/home/vagrant/blog-venv"
end
