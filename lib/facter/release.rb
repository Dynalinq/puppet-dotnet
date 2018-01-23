Facter.add('dotnet_release') do
  confine :osfamily => :windows
  setcode do
    value = nil
    Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full') do |regkey|
      value = regkey['Release']
    end
    value
  end
end        