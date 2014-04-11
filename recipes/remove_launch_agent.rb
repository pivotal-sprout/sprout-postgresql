opts = node['sprout']['postgresql']
plists_to_unload = [opts['other_plist_filenames_to_unload'], opts['plist_filename']].flatten.compact

plists_to_unload.each do |plist|
  plist_path = File.expand_path(plist, File.join('~', 'Library', 'LaunchAgents'))

  execute "unload the plist (shuts down the daemon)" do
    command %'launchctl unload -w #{plist_path}'
    user node['current_user']
    only_if { File.exists?(plist_path) }
  end

  file plist_path do
    action :delete
    only_if { File.exists?(plist_path) }
  end
end
