# remove all old versions of the gem
gem cleanup rjb

# choose which ones you want to remove
gem uninstall rjb

# remove version 1.1.9 only
gem uninstall rjb --version 1.1.9

# remove all versions less than 1.3.4
gem uninstall rjb --version '<1.3.4'

123