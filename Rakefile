desc 'This task triggers execution of all tests'
task :all_tests_execution do
  %w[create_report_folder_structure run_cucumber_tests].each do |task_name|
    sh "rake #{task_name}"
  end
end

desc 'This task will create cucumber report folder structure'
task :create_report_folder_structure do
  Dir.mkdir 'temp' unless Dir.exist? 'artifacts'
  Dir.mkdir 'temp/reports' unless Dir.exist? 'temp/reports'
  Dir.mkdir 'temp/reports/junit' unless Dir.exist? 'temp/reports/junit'
  Dir.mkdir 'temp/reports/json' unless Dir.exist? 'temp/reports/json'
end

desc 'This task will run cucumber tests and generate reports'
task :run_cucumber_tests do
  sh 'cucumber --publish-quiet -f junit -o temp/reports/junit -f pretty -f json -o temp/reports/json/report.json'
end
