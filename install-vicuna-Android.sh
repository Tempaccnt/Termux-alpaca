cd
pkg update && pkg upgrade -y
pkg install wget git cmake clang megatools -y
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make
cd models
wget https://huggingface.co/eachadea/ggml-vicuna-7b-1.1/resolve/main/ggml-vic7b-uncensored-q5_0.bin 
cd ..
cd examples
megadl https://mega.nz/file/jBAwXQqR#6DYF9pchM6H69RNzVO8PWSDBQDieMkXIKDwJxPjCShU
chmod +x chat-vic7B.sh
cd /$PREFIX/bin
echo 'clear' > chat-vic
echo 'cd' >> chat-vic
echo 'cd llama.cpp' >> chat-vic
echo 'cd examples' >> chat-vic
echo './chat-vic7B.sh' >> chat-vic
chmod +x chat-vic
