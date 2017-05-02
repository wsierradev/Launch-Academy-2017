require "pg"
require "csv"

def db_connection
  begin
    connection = PG.connect(dbname: "building_database")
    yield(connection)
  ensure
    connection.close
  end
end

csv_records = CSV.readlines('data.csv', headers: true)


zoning_types = csv_records.map { |record| record["zoning_type"] }  # get all zoning_types
zoning_types.uniq!  # remove duplicates

zoning_types.each do |type|
  db_connection do |conn|
    result = conn.exec_params(
      'SELECT name FROM zoning_types WHERE name=$1',
      [type]
    )

    if result.to_a.empty?
      sql = "INSERT INTO zoning_types (name) VALUES ($1)"
      conn.exec_params(sql, [type])
    end
  end
end


construction_types = csv_records.map { |record| record["construction_type"] }.uniq

construction_types.each do |type|
  db_connection do |conn|
    result2 = conn.exec_params(
      'SELECT name FROM construction_types WHERE name=$1',
      [type]
    )
    if result2.to_a.empty?
      sql = "INSERT INTO construction_types (name) VALUES ($1)"
      conn.exec_params(sql, [type])
    end
  end
end

db_connection do |conn|
  # iterate over CSV data
  csv_records.each do |record|
    zoning_type = record["zoning_type"]
    construction_type = record["construction_type"]

    # grab the correct foreign key values from each table
    zoning_type_id = conn.exec_params(
      'SELECT id FROM zoning_types WHERE name=$1',
      [zoning_type]
    )[0]["id"]

    construction_type_id = conn.exec_params(
      'SELECT id FROM construction_types WHERE name=$1',
      [construction_type]
    )[0]["id"]

    # insert new account record
    name = record["name"]
    conn.exec_params(
      'INSERT INTO accounts (name, zoning_type_id, construction_type_id) VALUES($1, $2, $3)',
      [name, zoning_type_id, construction_type_id]
    )
  end
end
