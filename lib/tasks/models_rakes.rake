desc "Import bike information into the appropriate tables." 
  task :import_models => :environment do
  	#Open up the fila containing the data
    current_set_model_name = ""
    first_model = true
    File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    	#parse contents into the appropriate variables	
    	make_id, make_name, model_id, model_name, year = line.strip.split("\;")
      if first_model
        current_set_model_name = model_name
        ma = Make.find_by(name: make_name)
        mo = ma.models.new(:name => model_name)
        mo.save
      else
        if current_set_model_name != model_name
          current_set_model_name = model_name
          ma = Make.find_by(name: make_name)
          mo = ma.models.new(:name => model_name)
          mo.save
        end
      end
      first_model = false
    end
  end