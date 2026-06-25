import subprocess
from datetime import datetime
import psutil

print("=================================")
print(" Linux Security Monitoring System")
print("=================================")

print("\nCurrent Date & Time:")
print(datetime.now())

# Logged In Users
print("\nLogged In Users:")
logged_users = subprocess.getoutput("who")
print(logged_users)

# Open Ports
print("\nOpen Ports:")
open_ports = subprocess.getoutput("ss -tuln")
print(open_ports)

# Failed Login Attempts
print("\nFailed Login Attempts:")
failed_logins = subprocess.getoutput(
    "grep 'Failed password' /var/log/auth.log 2>/dev/null | tail -10"
)
if failed_logins:
    print(failed_logins)
else:
    print("No failed login attempts found.")

# CPU Usage
print("\nCPU Usage:")
cpu_usage = psutil.cpu_percent(interval=1)
print(cpu_usage, "%")

# Memory Usage
print("\nMemory Usage:")
memory_usage = psutil.virtual_memory().percent
print(memory_usage, "%")

# Save Report
report_name = f"security_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"

with open(report_name, "w") as report:
    report.write("===== Linux Security Monitoring Report =====\n")
    report.write(f"Date & Time: {datetime.now()}\n\n")

    report.write("Logged In Users:\n")
    report.write(logged_users + "\n\n")

    report.write("Open Ports:\n")
    report.write(open_ports + "\n\n")

    report.write("Failed Login Attempts:\n")
    report.write(failed_logins + "\n\n")

    report.write(f"CPU Usage: {cpu_usage}%\n")
    report.write(f"Memory Usage: {memory_usage}%\n")

print("\nReport Generated Successfully!")
print("Report saved as:", report_name)
