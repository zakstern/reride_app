namespace :db do
desc "Import bike information into the appropriate tables." 
  task :import_bikes => :environment do
    load_makes
    load_models
    load_years
    load_version_relationships
  end
end

def load_makes
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

def load_models
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

def load_years
  File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    #parse contents into the appropriate variables  
    make_id, make_name, model_id, model_name, year = line.strip.split("\;")
    yr = Year.new(:year_value => year.to_i)
    yr.save
  end
end

def load_version_relationships
  File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    #parse contents into the appropriate variables  
    make_id, make_name, model_id, model_name, year = line.strip.split("\;")
    yr = Year.find_by(year_value: year.to_i)
    model = Model.find_by(name: model_name)
    model.version!(yr)
  end
end