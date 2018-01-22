Facter.add(:dotnet_release) do
    confine :kernel => :windows
    setcode do
      require 'win32/registry'
  
      value = nil
      hive = Win32::Registry::HKEY_LOCAL_MACHINE
      hive.open(*'*SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full',  Win32::Registry::KEY_READ | 0x100) do |reg|
        value = reg['release']
      end
      value
    end
  end    