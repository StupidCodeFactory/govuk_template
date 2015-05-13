require 'erb'

module Compiler
  class TemplateProcessor

    def initialize(file)
      @file = file
      @is_stylesheet = !!(file =~ /\.css\.erb\z/)
    end

    def process
      render_erb do |section = :layout|
        handle_yield(section)
      end
    end

    def raw html
      html
    end

    def render_erb
      ERB.new(File.read(@file)).result(binding)
    end

    def handle_yield(section = :layout)
      raise "Not implemented on the base class"
    end

    def content_for?(*args)
      raise "Not implemented on the base class"
    end

    def asset_path(file, options={})
      raise "Not implemented on the base class"
    end

    def method_missing(name, *args)
      puts "#{name} #{args.inspect}"
    end
  end
end
