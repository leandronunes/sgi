require 'iconv'
namespace :load do
  def select_object(model, name)
    return nil if name.blank?
    begin
      p = model.find_by_name(name)
      p ||= model.create!(:name => name)
    rescue
      p = model.find_by_code(name)
      p ||= model.create!(:code => name)
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
        p = Project.new 
        p.service =  select_object(Service, data[0])
        p.begin_date_predicted = data[1]
        p.begin_date_realized = data[2]
        p.end_date_predicted = data[3]
        p.end_date_realized = data[4]
#Esforco previsto data[5]
        p.state = select_object(State, data[6])
#Grupo Demanda: data[7]
        p.code =  data[8]
#%concluido: data[9]
        p.fp_predicted = data[10]
        p.fp_realized = data[11]
        p.priority = select_object(Priority, data[12])
        p.situation = select_object(Situation, data[13])
        p.process_type = select_object(ProcessType, data[14])
        p.ss_type = select_object(SsType, data[15])
        count += 1
        puts "Line #{count} Project not saved" unless p.save
        puts line
      end
    end
  end

  desc "Load appropriation information"
  task :appropriation => :environment do
    puts "Loadding appropriation..."
    count = 0
puts Dir.glob("#{Rails.root}/db/data/exportacao_apropriacao*").inspect
    Dir.glob("#{Rails.root}/db/data/exportacao_apropriacao*").map do |path|
      file = File.open(path)
      file.readline
      file.readlines.map do |line|
        next if line.strip.blank?
        data = line.split('|')
        a = Appropriation.new 
        a.service = select_object(Service, data[0])
#data[1Código do Insumo]
        a.date= data[2]
        time_str = data[3].split(':')
        a.time = time_str[0].to_i + time_str[1].to_f/60
        a.input = select_object(Input, data[4])
        a.activity = select_object(Activity, data[5])
        a.worker = select_object(Worker, data[7])
        a.worker.registration = data[6]
        a.worker.save
        a.time_type = select_object(TimeType, data[8])
        a.task_type = select_object(TaskType, data[9])

        count += 1
        puts "Line #{count}: #{line}"
        a.save!
      end
    end
  end
end
