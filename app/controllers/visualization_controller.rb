class VisualizationController < ApplicationController

  def bubble
  
  end

  def bubble_data
    h = {}
# Template
#    h[:header] = ["victories","country","runs","poles","podiums","champs"]
#    h[:values] = {
#      'Nigel Mansell' => { 'podiums' =>  59, 'runs' => 186, 'country' => "gb", 'poles' => 32, 'victories' =>  31, 'champs' => 1} ,
#      'Alain Prost' => { 'podiums' => 106, 'runs' => 198, 'country' => "fr", 'poles' => 33, 'victories' => 51, 'champs' => 4 },
#      'Mika Hakkinen' => { 'podiums' => 51, 'runs' => 161, 'country' => "fi", 'poles' => 26, 'victories' => 20, 'champs' => 2 },
#      'Niki Lauda' => { 'podiums' => 54, 'runs' => 170, 'country' => "at", 'poles' => 24, 'victories' => 25, 'champs' => 3},
#    }
    projects = Project.includes([:priority, :state, :situation, :process_type, :ss_type]).select(['name', 'fp_predicted', 'fp_realized', 'predicted_effort', 'percent_complete', 'priority_id', 'state_id', 'situation_id', 'process_type_id', 'ss_type_id', 'service_id']).limit(387)
    numeric_variables = ['fp_predicted', 'fp_realized', 'predicted_effort', 'percent_complete'] 
#    categoric_variables = ['priority', 'state', 'situation','ss_type','process_type']
    categoric_variables = ['priority', 'state', 'situation','ss_type']
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
    render :json => h
  end

end
