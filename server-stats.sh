echo "Total CPU Usage"
top -bn1 | grep "%Cpu"

echo "Total Memory Usage"
free -m
free -g
free -m | grep "Mem" | awk '{ printf("%.2f%%", $4/$2 * 100) }'


echo "Total Disk Usage"
df -h | awk '
NR==1 {
    printf("%s\tFree%%\n", $0)
}
NR>1{ printf("%s\t%s%%\n", $0, 100-$5) }
'


echo "Top 5 processes by CPU usage"
top -n 5

echo "Top 5 processes by memory usage"
top -o mem -n 5