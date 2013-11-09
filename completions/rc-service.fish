# Fist argument is the names of the service, i.e. a file in /etc/init.d
complete -c rc-service -n "test (count (commandline -poc)) = 1" -xa "(__fish_service_print_names)" --description "Service name"

#The second argument is what action to take with the service
complete -c rc-service -n "test (count (commandline -poc)) -gt 1" -xa "(__fish_complete_service_actions)"
