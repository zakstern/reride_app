desc "Import bike information into the appropriate tables." 
  task :import_years => :environment do
  	#Open up the fila containing the data
    File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    	#parse contents into the appropriate variables	
    	make_id, make_name, model_id, model_name, year = line.strip.split("\;")
      mo = Model.find_by(name: model_name)
      yr = mo.years.new(:year_value => year.to_i)
      yr.save
    end
  end