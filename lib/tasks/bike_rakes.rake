desc "Import bike information into the appropriate tables." 
  task :import_bikes => :environment do
  	#Open up the fila containing the data
  	first_model = true
  	first_make = true
    current_set_make_name = ""
    current_set_model_name = ""
    ma = ""
    mo = ""
    File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    	#parse contents into the appropriate variables	
    	make_id, make_name, model_id, model_name, year = line.strip.split("\;")
    	year_value = Date.new(year.to_i,1,1)

	    if first_make
	    	#first make
	      current_set_make_name = make_name
	      ma = Make.new(:name => make_name)
	      ma.save
      else
	      if current_set_make_name == make_name
          #still on the same make
          if first_model
            #first model
            current_set_model_name = model_name
            mo = ma.models.new(:name => model_name)
            mo.save
          else
            #not first model
            if current_set_model_name == model_name
              #still on the same model
              mo = ma.models.new(:name => model_name)
              mo.save
            else
              #new model
              current_set_model_name = model_name
              mo = ma.models.new(:name => model_name)
              mo.save
            end
          end
        else
          #new make
          current_set_make_name = make_name
          ma = Make.new(:name => make_name)
          ma.save
          current_set_model_name = model_name
          mo = ma.models.new(:name => model_name)
          mo.save
        end
	    end
    	first_make = false
      first_model = false
    end
  end