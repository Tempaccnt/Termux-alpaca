cd
# update packages
pkg update && pkg upgrade -y                                                                                 
# install necessary packages
pkg install clang wget git megatools cmake -y
#cloning the github repository of alpaca.cpp                                                                                                       
git clone  https://github.com/antimatter15/alpaca.cpp
#enter alpaca.cpp folder
cd alpaca.cpp                                                                                                                                      
#start building alpaca.cpp (if you get an error try replqcing make with cmake and see if that works)
make
echo -e  "\e[32m select whether to use hugginface or mega(recommended) to download the model?"
echo -e "enter 1 for huggingface or 2 for mega\e[39m"
read website
#downloading the 7B alpaca model
if [ $website -eq "1" ]
        then
                wget https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin
        else
                megadl https://mega.nz/file/3ZI2lA5Y#bAPt0tKWexZMf0GhoI_RMQ0OH4vXWFyfFbykXrIKZAY
fi
# making a shortcut script to launch alpaca easily with the word chat
cd /$PREFIX/bin
echo 'clear' > chat
echo 'cd' >> chat
echo 'cd alpaca.cpp' >> chat
echo './chat' >> chat
chmod +x chat
cd
