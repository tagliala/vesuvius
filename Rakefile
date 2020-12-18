# frozen_string_literal: true

module Compiler
  BASE_DIR          = File.dirname(__FILE__)
  HEROKU_VENDOR_DIR = '/app/.heroku/vendor'

  class << self
    private

    def with_temporary_folder(tmp_dir)
      FileUtils.mkdir_p [tmp_dir, HEROKU_VENDOR_DIR]
      yield
      FileUtils.rm_rf [tmp_dir, HEROKU_VENDOR_DIR]
    end
  end

  module_function

  def run
    scripts = Dir[File.join(BASE_DIR, 'scripts', 'libraries', '*.sh')]

    scripts.sort.each_with_index do |file, index|
      puts "\nCompiling #{File.basename(file)} (#{index + 1}/#{scripts.size})"
      tmp_dir = "#{BASE_DIR}/tmp/#{File.basename(file, '.sh')}"

      with_temporary_folder tmp_dir do
        _exit_code = `cd #{tmp_dir} && TARGET_DIR=#{BASE_DIR}/public/libraries HEROKU_VENDOR_DIR=#{HEROKU_VENDOR_DIR} #{file}`
      end
    end
  end
end

namespace :assets do
  desc 'Overrides default precompile task'
  task :precompile do
    Compiler.run
  end
end
