require "active_record"

def establish_connection
  ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: ":memory:"
  )
end
