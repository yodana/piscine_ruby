
class FtQueryController < ApplicationController
  def index
   
  end

  def create_db
    begin
      $db = SQLite3::Database.new 'ft_sql'
      @message = "Database created"
    rescue SQLite3::Exception => e
      puts "Error: #{e.message}"
      @message = "Error: #{e.message}"
    end
  end
  
  def create_table
    if $db.nil?
      redirect_to root_path
    end
    begin
      $db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS clock_watch (
          ts_id INTEGER PRIMARY KEY,
          day INTEGER,
          month INTEGER,
          year INTEGER,
          hour INTEGER,
          min INTEGER,
          sec INTEGER,
          race INTEGER,
          name VARCHAR(50),
          lap INTEGER
        );
      SQL
      $db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS race (
          r_id INTEGER PRIMARY KEY,
          start VARCHAR(50)
        );
      SQL
      @message = "Tables created successfully"
    rescue SQLite3::Exception => e
      puts "Error: #{e.message}"
      @message = "Error: #{e.message}"
    end
  end

  def drop_table
    if $db.nil?
      redirect_to root_path
      return
    end
    begin
      $db.execute("DROP TABLE IF EXISTS clock_watch")
      $db.execute("DROP TABLE IF EXISTS race")
      @message = "Tables dropped successfully"
    rescue SQLite3::Exception => e
      puts "Error: #{e.message}"
      @message = "Error: #{e.message}"
    end
  end

  def start_race
   
  end

  def insert_time_stamp
  
  end

  def delete_last

  end

  def destroy_all
   
  end

  def all_by_name
 
  end

  def all_by_race
   
  end

  def update_time_stamp
  
  end

  private


end
