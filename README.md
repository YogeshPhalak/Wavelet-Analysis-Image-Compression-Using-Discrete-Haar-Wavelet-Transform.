# Wavelet-Analysis-Image-Compression-Using-Discrete-Haar-Wavelet-Transform.


![Compressed_Images_Comparision](/media/New%20Bitmap%20Image.png)

![haar_gif](/media/Haar.gif)

![Symlet gif](/media/Symlets.gif)



**Function Descriptions 


# DWT (General):

use:
 wname = 'haar' for Haar Wavelet.
       = 'sym1' for Symlets.
       = 'db1'  for Daubechies wavelet.


 1)  **DWT** performs a single-level 1-D wavelet decomposition
    with respect to either a particular wavelet ('wname')
   D = DWT(C,'wname') computes the 1-D wavelet decomposition (D) of vector C.
   length of C must have form 2^j where j is positive integer.

 2)  **IDWT** performs an inverse single-level 1-D wavelet decomposition
    with respect to either a particular wavelet ('wname')
   C = IDWT(D,'wname') computes the inverse 1-D wavelet decomposition (C) of vector D.
   length of D must have form 2^j where j is positive integer.
 
 3)  **DWT2** performs a single-level 2-D wavelet decomposition
    with respect to either a particular wavelet ('wname')
   D = DWT2(C,'wname') computes the 2-D wavelet decomposition (D) of matrix C.
   size of C must have form 2^j*2^j where j is positive integer. 
 
 4)  **IDWT2** performs an Inverse single-level 2-D wavelet decomposition
    with respect to either a particular wavelet ('wname')
   C = IDWT2(D,'wname') computes the inverse 2-D wavelet decomposition (C) of matrix D.
   size of D must have form 2^j*2^j where j is positive integer. 

 5)  **DWT3** performs a single-level layerwise 2-D wavelet decomposition
    with respect to either a particular wavelet ('wname') of an image.
   imgD = DWT3(imgC,'wname') computes the layerwise 2-D wavelet decomposition (imgD) of image imgC.
   size of imgC must have form 2^j*2^j where j is positive integer. 
 
 6)  **IDWT3** performs an Inverse layerwise single-level 2-D wavelet decomposition
    with respect to either a particular wavelet ('wname') of an image.
   imgC = IDWT3(imgD,'wname') computes the inverse layerwize 2-D wavelet decomposition (imgC) of image imgD.
   size of imgD must have form 2^j*2^j where j is positive integer. 



# dht  (Discrete Haar Transform)

 1)  **dht** performs a single-level 1-D Discrete Haar Transform
   D = dht(C) computes the 1-D Discrete Haar Transform (D) of vector C.
   the function pads C to nearest power of two.

 2)  **idht** performs an inverse 1-D Discrete Haar Transform
   C = idht(D) computes the inverse 1-D Discrete Haar Transform (C) of vector D.
   the function pads D to nearest power of two.
 
 3)  **dht2** performs a 2-D Discrete Haar Transform
   D = dht2(C) computes the 2-D discrete Haar Transform (D) of matrix C.
   the matrix C will be padded to nearest power of two. 
 
 4)  **idht2** performs an Inverse 2-D Discrete Haar Transform
   C = idht2(D) computes the inverse 2-D Discrete Haar Transform (C) of matrix D.
   the matrix D will be padded to nearest power of two. 

 5)  **dht3** performs a single-level layerwise 2-D Discrete Haar Transform of an image.
   imgD = dht3(imgC) computes the layerwise 2-D discrete Haar Transform.
   size of imgC must will be padded to nearest power of two. 
 
 6)  **idht3** performs an Inverse layerwise single-level 2-D Discrete Haar Transform of an image.
   imgC = idht3(imgD) computes the inverse layerwize 2-D discrete Haar Transform (imgC) of image imgD.
   size of imgD must will be padded to nearest power of two. 


--Y. Phalak 4-Dec-2019.
   
