#generate .so file for fft c-model
cd ../o_ru_c_model/fft_cmodel/
rm -r build
mkdir build
cd build
cmake ../
make

#generate .so file for ifft c-model
cd ../../ifft_cmodel/
rm -r build
mkdir build
cd build
cmake ../
make

#generate .so file for ifft c-model
cd ../../phase_comp_cmodel/
rm -r build
mkdir build
cd build
cmake ../
make

cd ../../phase_comp_fft_cmodel/
rm -r build
mkdir build
cd build
cmake ../
make

