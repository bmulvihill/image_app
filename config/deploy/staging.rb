# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{ec2-user@54.191.18.201}
role :web, %w{ec2-user@54.191.18.201}
role :db,  %w{ec2-user@54.191.18.201}

set :ec2_config, 'config/ec2.yml'

set :ec2_project_tag, 'Project'
set :ec2_roles_tag, 'Roles'
set :ec2_stages_tag, 'Stages'

set :ec2_access_key_id, nil
set :ec2_secret_access_key, nil
set :ec2_region, %w{}
set :ec2_contact_point, nil
# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value
