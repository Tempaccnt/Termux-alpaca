cd
# update packages
pkg update && pkg upgrade -y
# install necessary packages
pkg install clang wget git cmake
#cloning the github repository of alpaca.cpp
git clone  https://github.com/antimatter15/alpaca.cpp
#enter alpaca.cpp folder
cd alpaca.cpp
#start building alpaca.cpp (if you get an error try replqcing make with cmake and see if that works)
make
#downloading the 7B alpaca model
wget https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin
# making a shortcut script to launch alpaca easily with the word chat
cd /$PREFIX/bin
echo 'clear' > chat
echo 'cd' >> chat
echo 'cd alpaca.cpp' >> chat
echo './chat' >> chat
chmod +x chat
cd
