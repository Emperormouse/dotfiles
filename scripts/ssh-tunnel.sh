# Make example.com point to 24.28.1.246 first
while true; do 
    ssh -p443 -ND 9999 malcolm@example.com -i /home/malcolm/.ssh/id_ed25519 -v
    sleep 10; 
done
