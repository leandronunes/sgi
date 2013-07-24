require 'iconv'
namespace :load do
  def select_object(model, name)
    return nil if name.blank?
    p = model.find_by_name(name)
    p ||= model.create!(:name => name)
  end

  desc "Load project information"
  task :project => :environment do
    puts "Loadding project..."
    Dir.glob("#{Rails.root}/db/data/exportacao_projeto*").map do |path|
      file = File.open(path)
      file.readline
      file.readlines.map do |line|
        data = line.split('|')
        p = Project.new 
        p.code =  data[0]
        p.begin_date_predicted = data[1]
        p.begin_date_realized = data[2]
        p.end_date_predicted = data[3]
        p.end_date_realized = data[4]
        p.state = select_object(State, data[6])
puts "Grupo Demanda: #{data[7]}"
puts "%concluido: #{data[8]}"
        p.fp_predicted = data[9]
        p.fp_realized = data[10]
        p.priority = select_object(Priority, data[11])
        p.situation = select_object(Situation, data[12])
        p.process_type = select_object(ProcessType, data[13])
        p.ss_type = select_object(SsType, data[14])
        p.save!
        puts line
      end
    end
  end

  desc "Load appropriation information"
  task :appropriation => :environment do
  end
end
