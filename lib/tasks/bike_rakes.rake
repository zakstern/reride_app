desc "Import bikes." 
  task :import_bikes => :environment do
    File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
      make_id, make, model_id, model, year = line.strip.split("\;")
      year_manufactured = Date.new(year.to_i,1,1)
      b = Bike.new(:make_id => make_id, :make => make, :model_id => model_id, :model => model, :year_manufactured => year_manufactured)
      b.save
    end
  end