require 'guard/compat/plugin'
require 'guard/railsbp/version'

module Guard
  class RailsBP < Plugin

    def initialize(options)
      super(default_options.merge!(options))
    end

    def start
      run_railsbp if options[:run_on_start]
    end

    def stop
      true
    end

    def reload
      run_railsbp
    end

    def run_all
      run_railsbp
    end

    def run_on_changes(_)
      run_railsbp
    end

    private

    def run_railsbp
      UI.info "Running Rails Best Practices"

      args = options.map do |key, value|
        case key
        when :run_on_start, :notify
        when :exclude
          "--exclude #{value}"
        else
          "--#{key}" if value
        end
      end.compact.join(' ')

      result = system("rails_best_practices #{args}")
      ::Guard::Notifier.notify('Rails Best Practices run has failed!', image: :failed) if options[:notify] && !result

      result
    end

    def default_options
      {
          run_on_start: true,
          silent: false,
          vendor: false,
          spec: false,
          test: false,
          features: false,
          notify: true
      }
    end
  end
end
