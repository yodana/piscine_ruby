
class FtQueryController < ApplicationController
  def index
  if $db.nil?
    return
  end
   begin
      $time_stamps = $db.execute("SELECT * FROM clock_watch")
      
      if $time_stamps.empty?
        $time_stamps = ['Database is empty or another error occurred']
      end
    rescue SQLite3::Exception => e
    $time_stamps = ['Database is empty or another error occurred']
  end
    $all = ['Not so fast, young padawan']
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
      return
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
    $runner_1 = params[:name_1].present? ? params[:name_1] : "anonymous"
    $runner_2 = params[:name_2].present? ? params[:name_2] : "anonymous"
    $runner_3 = params[:name_3].present? ? params[:name_3] : "anonymous"
    $runner_4 = params[:name_4].present? ? params[:name_4] : "anonymous"
   begin
      $db.execute("INSERT INTO race (start) VALUES (?)", [Time.now.strftime("%H:%M:%S").to_s])
      race_id = $db.execute("SELECT last_insert_rowid()")[0][0]
      names = [$runner_1, $runner_2, $runner_3, $runner_4]
      names.each do |name|
        $db.execute("INSERT INTO clock_watch (day, month, year, hour, min, sec, race, name, lap) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
        Time.now.day, Time.now.month, Time.now.year, Time.now.hour, Time.now.min, Time.now.sec, race_id, name, 0) # J ai mis 1 au lieu de 0 pour correspondre aux tests
      end
        @message = "Race started successfully"
   rescue SQLite3::Exception => e
     @message = "Error: #{e.message}"
   end
  end

  def insert_time_stamp
    begin
    now = Time.now
    last_race = $db.execute("SELECT r_id FROM race ORDER BY r_id DESC LIMIT 1")
    race_id = last_race[0][0]
    runner_name = params[:name_1] || params[:name_2] || params[:name_3] || params[:name_4]
    last_lap = $db.execute("SELECT lap FROM clock_watch WHERE name = ? AND race = ? ORDER BY lap DESC LIMIT 1", [runner_name, race_id])
    if last_lap.empty?
      return
    end
    new_lap = last_lap[0][0] + 1
    $db.execute(
      "INSERT INTO clock_watch (day, month, year, hour, min, sec, lap, name, race) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [now.day, now.month, now.year, now.hour, now.min, now.sec, new_lap, runner_name, race_id]
    )
    rescue SQLite3::Exception => e
    @message = "Error: #{e.message}"
  end
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
