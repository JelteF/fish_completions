function __fish_print_service_names -d 'All services known to the system'
    command rc-service -l
end
