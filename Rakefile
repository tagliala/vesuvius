# frozen_string_literal: true

task :build_libraries do
  BASE_DIR          = File.dirname(__FILE__)
  HEROKU_VENDOR_DIR = '/app/.heroku/vendor'
  LIBRARIES_PARTIAL = File.join(BASE_DIR, 'views', 'libraries.slim')

  def with_temporary_folder(tmp_dir)
    FileUtils.mkdir_p [tmp_dir, HEROKU_VENDOR_DIR]
    yield
    FileUtils.rm_rf [tmp_dir, HEROKU_VENDOR_DIR]
  end

  def run_scripts
    scripts = Dir[File.join(BASE_DIR, 'scripts', 'libraries', '*.sh')]

    scripts.each_with_index do |file, index|
      puts "\n-----> Running #{File.basename(file)} (#{index + 1}/#{scripts.size})"
      tmp_dir = "#{BASE_DIR}/tmp/#{File.basename(file, '.sh')}"

      with_temporary_folder tmp_dir do
        _exit_code = `cd #{tmp_dir} && TARGET_DIR=#{BASE_DIR}/public/libraries HEROKU_VENDOR_DIR=#{HEROKU_VENDOR_DIR} #{file}`
      end
    end
  end

  puts '-----> Vesuvius is building libraries, please wait'

  run_scripts
end
