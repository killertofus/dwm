rustdesk=$(curl -s https://api.github.com/repos/rustdesk/rustdesk/releases | \
jq -r 'first(.[].tag_name | select(test("^[0-9]")))' )




streamlink_twitch_gui=$(curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases | \
jq -r 'first(.[].tag_name | select(test("^v[0-9]")))' )


if ! [ -e "streamlink_twitch_gui.txt" ] ; then
    touch "streamlink_twitch_gui.txt"
fi
if [ "$streamlink_twitch_gui" != "$(cat streamlink_twitch_gui.txt)" ]; then curl -s https://api.github.com/repos/streamlink/streamlink-twitch-gui/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -; 
echo "$streamlink_twitch_gui" > streamlink_twitch_gui.txt
mv -- *.AppImage streamlink_twitch_gui.AppImage
fi






if ! [ -e "rustdesk.txt" ] ; then
    touch "rustdesk.txt"
fi
if [ "$rustdesk" != "$(cat rustdesk.txt)" ]; then curl -s https://api.github.com/repos/rustdesk/rustdesk/releases/latest \
| grep "x86_64.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -; 
echo "$rustdesk" > rustdesk.txt
mv  -- *x86_64.AppImage rustdesk.AppImage
fi

