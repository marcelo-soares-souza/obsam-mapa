user = User.new(:fullname => 'OBSAM Administrator', :email => 'admin@localhost', :password => 'obsam', :password_confirmation => 'obsam', :admin => 't').save(validate: false)
