function mysql_drop_and_create_db
        if test (count $argv) -lt 3
                echo "Not enough arguments! Usage: mysql_drop_and_create_db <database> <user> <pwd> [<file>]"
        else
                echo "Creating DB $argv[1]"
                echo "drop database $argv[1] ; CREATE DATABASE $argv[1] DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci; " | mysql -u $argv[2] -p$argv[3]
                if test (count $argv) -gt 3
                        echo "Loading $argv[4] into $argv[1]"
                        mysql -u $argv[2] -p$argv[3] $argv[1] < $argv[4]
                end
        end
end
