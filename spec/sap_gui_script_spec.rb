RSpec.describe SapNiwaki::SapGuiScript do

  it 'connects without using SAP Logon for Windows' do
    @sap_gui_script = SapNiwaki::SapGuiScript.new
  end
end
