# Manage NTP
# Class:: chris_ntp_params (
#
#
type ServiceState = Enum['running', 'stopped']

class pbg_ntp (
  Boolean $start_at_boot,
  String[1] $version = 'installed',
  ServiceState $state =  'running',
) {
  ensure_packages(['ntp'],
    {
      ensure => $version,
    }
  )

  service {
    "ntp":
      ensure   => $state,
      enable   => $start_at_boot,
  }
}
