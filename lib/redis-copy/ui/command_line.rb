# encoding: utf-8

module RedisCopy
  module UI
    class CommandLine
      implements UI do |options|
        options[:ui].to_s.underscore.dasherize == 'command-line'
      end

      def confirm?(prompt)
        $stderr.puts(prompt)
        return true unless @options[:prompt]
        $stderr.puts("Continue? [yN]")
        abort unless $stdin.gets.chomp =~ /y/i
        true
      end

      def abort(message = nil)
        notify(['ABORTED',message].compact.join(': '))
        exit 1
      end

      def notify(message)
        $stderr.puts(message)
      end
    end
  end
end
