#Deploy code to production server
role :app, %w{ec2-user@54.186.30.96}
role :web, %w{ec2-user@54.186.30.96}
role :db,  %w{ec2-user@54.186.30.96}

set :ec2_access_key_id, nil
set :ec2_secret_access_key, nil
set :ec2_region, %w{us-west-2}
set :ec2_contact_point, nil
