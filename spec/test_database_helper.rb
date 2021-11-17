def reset_test_database
  conn = PG.connect(dbname: 'makersbnb_test')
  conn.exec("TRUNCATE TABLE spaces")
  conn.exec("INSERT INTO spaces (name, available) VALUES ('Windsor Castle', true);")
  conn.exec("INSERT INTO spaces (name, available) VALUES ('Roka Rooms', true);")
end

