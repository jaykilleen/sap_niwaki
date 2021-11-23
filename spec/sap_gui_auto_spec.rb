RSpec.describe SapNiwaki::SapGuiAuto do

  before(:all) do

  end

  after(:all) do
    @sap_gui_auto.close_connection
  end

  it "connects to an existing open instance of SAP Login for Windows" do
    @sap_gui_auto = SapNiwaki::SapGuiAuto.new
    expect(@sap_gui_auto.connected?).not_to be nil
  end

  it 'can close a session of SAP Login for Windows' do
    skip
    @sap_gui_auto = SapNiwaki::SapGuiAuto.new
    # How to handle:
    #   WIN32OLERuntimeError:
    #    (in OLE method `Client': )
    #        OLE error code:0 in <Unknown>
    #          <No Description>
    #        HRESULT error code:0x80010105
    #          The server threw an exception.
    expect(@sap_gui_auto.connected?).to be nil
  end

  it 'connects without using SAP Logon for Windows' do
    byebug
    sap_gui_script = SapNiwaki::SapGuiScript.new
    @sap_gui_auto = SapNiwaki::SapGuiAuto.new
    expect(@sap_gui_auto.connected?).not_to be nil
  end
end





  