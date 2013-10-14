desc "Import bike information into the appropriate tables." 
  task :load_versions => :environment do
  	#Open up the fila containing the data
    File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    	#parse contents into the appropriate variables	
    	make_id, make_name, model_id, model_name, year = line.strip.split("\;")
      	yr = Year.find_by(year_value: year.to_i)
      	model = Model.find_by(name: model_name)
      	model.version!(yr)
    end
  end