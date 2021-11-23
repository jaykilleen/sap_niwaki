module SapNiwaki
  class SapGuiScript
    attr_accessor :connection, :session, :info, :sap_gui_path, :win_title, :sid, :client, :user, :pw

    #-Sub Main-------------------------------------------------------------
    def initialize
      @sap_gui_path = 'C:/Program Files (x86)/SAP/FrontEnd/SAPgui/'
      @win_title = "SAP Easy Access"
      @user = "killeenj"
      @pw = "CaramelloKoala1"
      @sid = "ERP"
      @client = "300"
      @wsh = WIN32OLE.new('WScript.Shell')

      byebug

      if !@wsh.nil?
        @wsh.Exec @sap_gui_path + "sapshcut.exe -system=#{ @sid } -client=300 -user=#{ @user } -pw=#{ @pw }"
      end

      # Wait for the window to be activated
      while @wsh.AppActivate(win_title)
        sleep 1
        p 'slept 1 second...'
      end
    end

    def wsh
      @wsh
    end
  end
end