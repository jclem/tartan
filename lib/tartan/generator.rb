require 'tartan/version'
require 'fileutils'
require 'thor'

module Tartan
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'install', 'Install Tartan into your project'
    method_options :path => :string, :force => :boolean
    def install
      if tartan_files_already_exist? && !options[:force]
        puts 'Tartan files already installed, doing nothing.'
      else
        install_files
        puts "Tartan files installed to #{install_path}/"
      end
    end

    desc 'update', 'Update Tartan'
    method_options :path => :string
    def update
      if tartan_files_already_exist?
        remove_tartan_directory
        install_files
        puts 'Tartan files updated.'
      else
        puts 'No existing Tartan installation. Doing nothing.'
      end
    end

    desc 'version', 'Show version'
    def version
      say "Tartan #{Tartan::VERSION}"
    end

    private

    def tartan_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
        Pathname.new(File.join(options[:path], 'tartan'))
      else
        Pathname.new('tartan')
      end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_tartan_directory
      FileUtils.rm_rf('tartan')
    end

    def make_install_directory
      FileUtils.mkdir(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
