desc "Import bike make information into the appropriate table." 
  task :import_makes => :environment do
  	#Open up the fila containing the data
    current_set_make_name = ""
    first_make = true
    File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    	#parse contents into the appropriate variables	
    	make_id, make_name, model_id, model_name, year = line.strip.split("\;")
      if first_make
        current_set_make_name = make_name
        ma = Make.new(:name => make_name)
        ma.save
      else
        if current_set_make_name != make_name
          current_set_make_name = make_name
          ma = Make.new(:name => make_name)
          ma.save
        end
      end
      first_make = false
    end
  end