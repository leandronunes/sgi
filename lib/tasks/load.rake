require 'iconv'

REGIONS = {
  'DEBSA' => ['Brasilia', 'df'],
  'DEBLM' => ['Belem', 'pa'],
  'DEFLA' => ['Fortaleza', 'ce'],
  'DERCE' => ['Recife', 'pe'],
  'DESDR' => ['Salvador', 'ba'],
  'DEBHE' => ['Belo Horizonte', 'mg'],
  'DERJO' => ['Rio de Janeiro', 'rj'],
  'DESPO' => ['Sao Paulo', 'sp'],
  'DECTA' => ['Curitiba', 'pr'],
  'DEPAE' => ['Porto Alegre', 'rs'],
}

namespace :load do

  def get_localization(place)
    return nil if place.blank?
    codename =  nil
    REGIONS.keys.map do |key|
      if place.match("/#{key}/")
        codename = key
        break
      end
    end
    localization_info = REGIONS[codename] || []
    localization = Localization.find_by_name(localization_info.first)
    localization ||= Localization.create(:name => localization_info.first, :abbreviation => localization_info.second)
    localization
  end

  def select_object(model, name)
    return nil if name.blank?
    begin
      p = model.find_by_name(name)
      p ||= model.create!(:name => name)
    rescue
      begin
        p = model.find_by_code(name)
        p ||= model.create!(:code => name)
      rescue
      end
    end
  end

  desc "Load project information"
  task :project => :environment do
    puts "Loadding project..."
    count = 0 
    Dir.glob("#{Rails.root}/db/data/exportacao_projeto*").map do |path|
      file = File.open(path)
      file.readline
      file.readlines.map do |line|
        data = line.split('|')
        p = Project.find_by_code(data[7])
        p ||= Project.new 
#        p.service =  select_object(Service, data[0])
#        p.begin_date_predicted = data[1]
#        p.begin_date_realized = data[2]
#        p.end_date_predicted = data[3]
#        p.end_date_realized = data[4]
#        p.predicted_effort = data[5]
#        p.state = select_object(State, data[6])
#        p.code =  data[7]
        p.localization = get_localization(data[8])
#        p.name =  data[9]
#        p.percent_complete =  data[10]
#        p.fp_predicted = data[11]
#        p.fp_realized = data[12]
#        p.priority = select_object(Priority, data[13])
#        p.situation = select_object(Situation, data[14])
#        p.process_type = select_object(ProcessType, data[15])
#        p.ss_type = select_object(SsType, data[16])
        p.save
        count += 1
        puts "Line #{count}" 
#        puts line
      end
    end
  end

  desc "Load appropriation information"
  task :appropriation => :environment do
    puts "Loadding appropriation..."
    count = 0

#    Dir.glob("#{Rails.root}/db/data/exportacao_apropriacao*").map do |path|
    path = ARGV[1]
      file = File.open(path)
      file.readline
      file.readlines.map do |line|
        next if line.strip.blank?
        data = line.split('|')
        a = Appropriation.new 
#        a.service = select_object(Service, data[0])
#data[0] codigo do servico
#data[1Código do Insumo]
        a.date= data[2]
        time_str = data[3].split(':')
        a.time = time_str[0].to_i + time_str[1].to_f/60
        a.input = select_object(Input, data[4])
        a.activity = select_object(Activity, data[5])
        a.worker = select_object(Worker, data[8])
        a.worker.registration = data[6]
        a.worker.save
#puts data[7].inspect
        begin
          a.project = select_object(Project, data[7])
        rescue
        end
        a.time_type = select_object(TimeType, data[9])
        a.task_type = select_object(TaskType, data[10])

        count += 1
        puts "Line #{count}: #{line}" #if (count  % 1000) == 0
        puts "Appropriation not saved " unless a.save
      end
#    end
  end
end
