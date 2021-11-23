module SapNiwaki
  class SapGuiAuto
    attr_accessor :connection, :session, :info

    # https://blogs.sap.com/2017/06/11/how-to-use-sap-gui-scripting-inside-ruby-programming-language/

    def initialize
      # @log = SapNiwaki.logger
      # @log.debug "Initialising SAP session..."
      #Set SapGuiAuto = GetObject("SAPGUI")
      begin
        sapguiauto = WIN32OLE.connect("SAPGUI")
        if(sapguiauto == nil)
          return
        end
      rescue => exception
        # @log.error "You need to have SAP GUI software installed and running for gruiby to work."
        exit
      end

      #Set application = SapGuiAuto.GetScriptingEngine
      application = sapguiauto.GetScriptingEngine
      if(application == nil)
        return
      end

      #Set connection = application.Children(0)
      begin
        @connection = application.Children(0)
        if(@connection == nil)
          return
        end
      rescue => exception
        # @log.error "You need to be logged into SAP GUI for this program to run."
        exit
      end

      #Set session = connection.Children(0)
      @session = @connection.Children(0)
      if(@session == nil)
        return
      end

      # @log.debug "Sap session initialised."
    end

    def connected?
      # Id is like "/app/con[0]/ses[0]"
      # If it is present then you must be connected
      return true if @session.info.Client != ''
    end

    def lock
      @session.LockSessionUI
    end

    def unlock
      @session.UnlockSessionUI
    end

    def end_transaction
      @session.EndTransaction
    end

    def close_session
      @connection.CloseSession @session.Id
    end

    def close_connection
      @connection.CloseConnection
    end
  end
end