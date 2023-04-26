cd
# update packages
pkg update && pkg upgrade -y
# install necessary packages
pkg install clang wget git cmake megatools -y
#cloning the github repository of alpaca.cpp
git clone  https://github.com/antimatter15/alpaca.cpp
#enter alpaca.cpp folder
cd alpaca.cpp
#start building alpaca.cpp (if you get an error try replqcing make with cmake and see if that works)
make
#downloading the 7B alpaca model
megadl https://mega.nz/file/3ZI2lA5Y#bAPt0tKWexZMf0GhoI_RMQ0OH4vXWFyfFbykXrIKZAY
# making a shortcut script to launch alpaca easily with the word chat
cd /$PREFIX/bin
echo 'clear' > chat
echo 'cd' >> chat
echo 'cd alpaca.cpp' >> chat
echo './chat' >> chat
chmod +x chat
cd
