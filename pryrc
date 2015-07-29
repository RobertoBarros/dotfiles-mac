# https://github.com/cldwalker/hirb/issues/81
begin
  require 'hirb'
  Hirb.enable

  old_print = Pry.config.print
  Pry.config.print = proc do |*args|
    Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
  end
rescue LoadError
  puts 'warning: hirb not installed'
end

# vim: filetype=ruby
