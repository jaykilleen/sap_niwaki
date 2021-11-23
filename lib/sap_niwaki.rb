require "sap_niwaki"
require "sap_niwaki/version"
require 'sap_niwaki/sap_gui_script'
require 'sap_niwaki/sap_gui_auto'
require 'win32ole'
require 'byebug'

module SapNiwaki
  class << self
    attr_accessor :logger
  end
end
