class Authlogic < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      #authlogic colums cut/paist etc.
      t.string    :login                                              # optional, you can use email instead, or both
      t.string    :crypted_password                                   # optional, see below
      t.string    :password_salt                                      # optional, but highly recommended
      t.string    :persistence_token                                  # required
      t.string    :single_access_token                                # optional, see Authlogic::Session::Params
      t.string    :perishable_token                                   # optional, see Authlogic::Session::Perishability

      # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
      t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
      t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
      t.string    :current_login_ip                                   # optional, see Authlogic::Session::MagicColumns
      t.string    :last_login_ip                                      # optional, see Authlogic::Session::MagicColumns
    end  

    
    #change_column :customers, :login,               :string, :null => false
    #change_column :customers, :crypted_password,    :string, :null => false
    #change_column :customers, :password_salt,       :string, :null => false
    #change_column :customers, :persistence_token,   :string, :null => false
    #change_column :customers, :single_access_token, :string, :null => false
    #change_column :customers, :perishable_token,    :string, :null => false
  end

  def self.down
    change_table :customers do |t|
      t.remove   :login
      t.remove   :crypted_password
      t.remove   :password_salt
      t.remove   :persistence_token
      t.remove   :single_access_token
      t.remove   :perishable_token
      t.remove   :login_count
      t.remove   :failed_login_coun
      t.remove   :last_request_at
      t.remove   :current_login_at
      t.remove   :last_login_at
      t.remove   :current_login_ip
      t.remove   :last_login_ip
    end
  end
end
