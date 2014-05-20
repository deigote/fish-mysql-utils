function mysql_set_log_query_status_usage
	print_error "Not enough arguments or wrong status provided! Usage: mysql_set_log_query_status <on/off> [any_mysql_params]"
end

function mysql_set_log_query_status
	test (count $argv) -lt 1 ;and mysql_set_log_query_status_usage;and return
	test $argv[1] != 'on' -a $argv[1] != 'off' ;and mysql_set_log_query_status_usage ;and return
	if test (count $argv) -gt 1
		set mysql_args $argv[2..-1]
	end
	set log_status (echo $argv[1] | tr '[a-z]' '[A-Z]')
	print_msg "Setting log queries as $log_status"
	echo "SET GLOBAL general_log = '$log_status';" | mysql $mysql_args
end
