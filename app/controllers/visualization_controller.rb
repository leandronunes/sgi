class VisualizationController < ApplicationController

  def bubble
  
  end

  def bubble_data
    h = {}
    projects = Project.includes([:priority, :state, :situation, :process_type, :ss_type, :localization]).select(['name', 'fp_predicted', 'fp_realized', 'predicted_effort', 'percent_complete', 'priority_id', 'state_id', 'situation_id', 'process_type_id', 'ss_type_id', 'service_id', 'localization_id']).limit(200)
    numeric_variables = ['fp_predicted', 'fp_realized', 'predicted_effort', 'percent_complete'] 
    categoric_variables = ['priority', 'state', 'situation','ss_type', 'localization']
    h[:header] = numeric_variables + categoric_variables
    h[:values] = {}

    projects.map do |project|
      value = {} 
      value[project.name] = {}
      numeric_variables.map do |x|
        value[project.name].merge!({x => project.send(x) || 0})
      end
      categoric_variables.map do |x|
        category = project.send(x)
        value[project.name].merge!({x => category.nil? ? '' : category.name})
      end
      h[:values].merge!(value)
    end


    render :json => h
  end

  def map
  
  end

  def map_data
    h = {}
    numeric_variables = ['fp_predicted', 'fp_realized', 'predicted_effort', 'percent_complete'] 
    h[:header] = numeric_variables
    h[:values] = {}
   
    localizations = {}
    Localization.all.map do |l| 
      localizations[l.id] = l.abbreviation
      h[:values][l.abbreviation] = {}
    end
    
    numeric_variables.map do |var|
      operation = var == 'percent_complete' ? Project.group(['localization_id']).average(var) : Project.group(['localization_id']).sum(var)
      operation.map do |k,v|
        next if k.nil?
        h[:values][localizations[k]].merge!({var => v})
      end
    end

    render :json => h
  end


  def parallel
  end 

  def parallel_data
    h = {}
    h[:header] = ['Total']
    h[:values] = {}

    categoric_variables = ['priority', 'state', 'situation','ss_type', 'localization']

    JSON.parse(params[:state]).map do |key, value|
      h[:values][key] = {:total => Project.count}
      
      value.map do |k,v|
        categoric_variable = k.constantize.find_by_name(v)
        h[:values][key].merge!({k => categoric_variable.projects.count})
      end
#      Project.group(['localization_id']).sum(var)
      
    end

    render :json => h
  end

end
