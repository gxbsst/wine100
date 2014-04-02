# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/deployer/apps/Wine100/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/deployer/apps/Wine100/current/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/deployer/apps/Wine100/current/log/unicorn.log"
stdout_path "/home/deployer/apps/Wine100/current/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.wine100-registration.sock"
listen "/tmp/unicorn.wine100-registration.sock"

# Number of processes
# worker_processes 4
worker_processes 4

# Time-out
timeout 30
