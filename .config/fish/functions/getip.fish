function getip
    ip addr show | grep -A 10 eth0 | grep -oP "inet\ (\d{1,3}\.{0,1}){4}" | awk '{ printf $2}' | xclip -sel clip
end
