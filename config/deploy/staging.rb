# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{ec2-user@54.191.18.201}
role :web, %w{ec2-user@54.191.18.201}
role :db,  %w{ec2-user@54.191.18.201}

set :ec2_access_key_id, nil
set :ec2_secret_access_key, nil
set :ec2_region, %w{}
set :ec2_contact_point, nil
