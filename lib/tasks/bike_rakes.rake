namespace :db do
desc "Import bike information into the appropriate tables." 
  task :import_bikes => :environment do
    load_makes
    load_models
    load_years
    load_version_relationships
    load_bikes
  end
end

def load_makes
  current_set_make_id = 0
  first_make = true
  File.open("bicycle_BBB_full_data_2013-10-21", "r").each do |line|
    #parse contents into the appropriate variables  
    bike_id, make_id, make_name, model_id, model_name, year, msrp, like_new_value, excellent_value, good_value, fair_value = line.strip.split("\;")
    if first_make
      current_set_make_id = make_id
      ma = Make.new(:id => make_id, :name => make_name)
      ma.save
    else
      if current_set_make_id != make_id
        current_set_make_id = make_id
        ma = Make.new(:id => make_id, :name => make_name)
        ma.save
      end
    end
    first_make = false
  end
end

def load_models
  current_set_model_id = 0
  first_model = true
  File.open("bicycle_BBB_full_data_2013-10-21", "r").each do |line|
    #parse contents into the appropriate variables  
    bike_id, make_id, make_name, model_id, model_name, year, msrp, like_new_value, excellent_value, good_value, fair_value = line.strip.split("\;")
    if first_model
      current_set_model_id = model_id
      ma = Make.find(make_id)
      mo = ma.models.new(:id => model_id, :name => model_name)
      mo.save
    else
      if current_set_model_id != model_id
        current_set_model_id = model_id
        ma = Make.find(make_id)
        mo = ma.models.new(:id => model_id, :name => model_name)
        mo.save
      end
    end
    first_model = false
  end
end

def load_years
  File.open("bicycle_BBB_full_data_2013-10-21", "r").each do |line|
    #parse contents into the appropriate variables  
    bike_id, make_id, make_name, model_id, model_name, year, msrp, like_new_value, excellent_value, good_value, fair_value = line.strip.split("\;")
    yr = Year.new(:year_value => year.to_i)
    yr.save
  end
end

def load_version_relationships
  File.open("bicycle_BBB_full_data_2013-10-21", "r").each do |line|
    #parse contents into the appropriate variables  
    bike_id, make_id, make_name, model_id, model_name, year, msrp, like_new_value, excellent_value, good_value, fair_value = line.strip.split("\;")
    yr = Year.find_by(year_value: year.to_i)
    model = Model.find(model_id)
    model.version!(yr)
  end
end

def load_bikes
  File.open("bicycle_BBB_full_data_2013-10-21", "r").each do |line|
    #parse contents into the appropriate variables 
    if line.strip.include? "Unspecified"
      bike_id, make_id, make_name, model_id, model_name, year, msrp, bbb_price = line.strip.split("\;")
      msrp = nil
      like_new_value = nil
      excellent_value = nil
      good_value = nil
      fair_value = nil
    else
      bike_id, make_id, make_name, model_id, model_name, year, msrp, like_new_value, excellent_value, good_value, fair_value = line.strip.split("\;")
      
      blank, msrp = msrp.strip.split("\$")
      msrp = price(msrp)
      
      blank, like_new_value = like_new_value.strip.split("\$")
      like_new_value = price(like_new_value)
      
      blank, excellent_value = excellent_value.strip.split("\$")
      excellent_value = price(excellent_value)
      
      blank, good_value = good_value.strip.split("\$")
      good_value = price(good_value)

      blank, fair_value = fair_value.strip.split("\$")
      fair_value = price(fair_value)
    end 
    bike = Bike.new(:id => bike_id.to_i, :make_id => make_id.to_i, :model_id => model_id.to_i, :year_id => year.to_i, 
      :msrp => msrp, :like_new_value => like_new_value, :excellent_value => excellent_value, :good_value => good_value, :fair_value => fair_value)
    bike.save 
  end
end

def price(num)
  num.gsub!(',','') if num.is_a?(String)
  price = num.to_d
  price
end