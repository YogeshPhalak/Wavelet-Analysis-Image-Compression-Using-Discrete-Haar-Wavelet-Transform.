# Wavelet-Analysis-Image-Compression-Using-Discrete-Haar-Wavelet-Transform.


<img  src="/media/Symlets.gif" width="250" height="250"/>
<img  src="/media/Haar.gif" width="250" height="250"/>



## Function Descriptions 


### DWT (General):

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



### dht  (Discrete Haar Transform)

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


Introduction
============

Signal-Processing is faster and simpler in a sparse representation where few Fourier coefficients reveal the information. Such representations can be constructed by decomposing signals over elementary waveforms chosen in the orthonormal basis domain explained in general Fourier analysis. But results are shown by such methods sometimes introduces
errors due to certain conditions. Such conditions can be taken care of by wavelet transforms.

The discovery of wavelet orthogonal bases and local time-frequency basis has opened the door to huge ways of new transforms. Adapting sparse representations to signal properties, and deriving efficient processing operators, is, therefore, a necessary survival strategy. An orthogonal basis is a dictionary of the minimum size that can yield a sparse representation if designed to concentrate the signal energy over a set of few vectors. This set gives a geometric signal description.

In this report, we will present an example of an orthonormal system on \[0, 1) known as the Haar system. The Haar basis is the simplest and historically the first example of an orthonormal wavelet basis. Many of its properties stand in sharp contrast to the corresponding properties of the trigonometric basis (Fourier Basis). For example, (1) The Haar basis functions are supported on small subintervals of \[0, 1), whereas the Fourier basis functions are nonzero on all of \[0,1), (2) The Haar basis functions are step functions with jump discontinuities, whereas the Fourier basis functions are *C*<sup>∞</sup> on \[0, 1), (3) The Haar basis replaces the notion of frequency (represented by the index n in the Fourier basis) with the dual notions of scale and location (separately indexed by j and k), (4) the Haar basis provides a very efficient representation of functions that consist of smooth, slowly varying segments punctuated by sharp peaks and discontinuities, whereas the Fourier basis best represents functions that exhibit long term oscillatory behavior.

Fourier Analysis And Its Limitations.
=====================================

When processing signals, such as audio, radio waves, light waves, seismic waves, and even images, Fourier analysis can isolate narrowband components of a compound waveform, concentrating them for easier detection or removal. A large family of signal processing techniques consist of Fourier-transforming a signal, manipulating the Fourier-transformed data in a simple way, and reversing the transformation

General Advantages And Disadvantages.
-------------------------------------

**Advantages.**

-   Fourier series and the Fourier transform hold a unique place in the analysis of many linear operators, essentially because the complex exponentials are the eigenvectors/eigenfunctions of linear, shift-invariant operators. In signal processing, this is illustrated via the convolution theorem, though the theory goes much deeper (see: Pseudo-differential operators). Related to this is the role of the Fourier transform in the mathematical foundations of quantum mechanics - Fourier analysis is directly related to "momentum", since the eigenfunctions of the momentum operator − *i*∂<sub>*x*</sub> are the complex exponentials.

-   In this same vein, Fourier analysis leads to an extremely powerful theory of smoothness, because of the correspondence between differentiability and decay of the Fourier coefficients. See Sobolev spaces.

-   Fourier analysis is very powerful in the study of generalized functions.

-   From a numerical analysis and signal processing point of view, the accuracy of Fourier based methods has the advantage of being limited only by the smoothness of the underlying function. This means several things: Fourier methods are very good at approximating very smooth things, but perhaps not so good at approximating less smooth things.

-   The general techniques we learn from Fourier, like expanding functions in an orthonormal basis, are extremely powerful. See spectral theory.

**Disadvantages.**

-   First off, from a numerical standpoint, issues of convergence play a massive role. See Gibbs Phenomenon. This leads to a secondary issue that Fourier series are not "efficient" at resolving discontinuous or multi-scale functions. This is illustrated, for example, by the vast difference between original JPEG image compression, which is based on Fourier series, and modern image compression techniques like JPEG2000, which are based on more multi-scale techniques like Wavelets.

-   Related to the above fact is that the Fourier series give no information on the spatial/temporal localization of features. A Fourier series or transform can tell you that there is a discontinuity, but it can’t tell you where it is. Think of a musical score: having just the Fourier transform is like knowing which notes you need to play, but not when to play them. Not very useful if you want to hear music! This is partially what inspired the study of phase-space/time-frequency/wavelet representations (which incidentally are playing an increasing role in quantum theory).

-   Classical Fourier analysis is less generally applicable for nonlinear and nonstationary/transient phenomenon (although it is still hugely powerful in some cases!)

The Gibbs phenomenon.
=====================

The Gibbs phenomenon involves both the fact that Fourier sums overshoot at a jump discontinuity, and that this overshoot does not die out as more terms are added to the sum.

The three figures below demonstrate the phenomenon for a square wave of height *π*/4 whose Fourier expansion is given by:

![equation](http://latex.codecogs.com/gif.latex?%5Csin%20%28x%29%2B%5Cfrac%7B1%7D%7B3%7D%20%5Csin%20%283%20x%29%2B%5Cfrac%7B1%7D%7B5%7D%20%5Csin%20%285%20x%29%2B%5Ccdots%0A)

As can be seen, as the number of terms rises, the error of the approximation is reduced in width and energy, but converges to a fixed height. A calculation for the square wave gives an explicit formula for the limit of the height of the error. It turns out that the Fourier series exceeds the height *π*/4 of the square wave by:

![equation](http://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B2%7D%20%5Cint_%7B0%7D%5E%7B%5Cpi%7D%20%5Cfrac%7B%5Csin%20t%7D%7Bt%7D%20d%20t-%5Cfrac%7B%5Cpi%7D%7B4%7D%3D%5Cfrac%7B%5Cpi%7D%7B2%7D%20%5Ccdot%280.089489872236%20%5Cdots%29%0A)
    
![Gibbs Phenomenon](/media/Gibbs.png)

The Gibbs phenomenon reflects the difficulty inherent in approximating a discontinuous function by a finite series of continuous sine and cosine waves. It is important to put emphasis on the word finite because even though every partial sum of the Fourier series overshoots the function it is approximating, the limit of the partial sums does not. The value of x where the maximum overshoot is achieved moves closer and closer to the discontinuity as the number of terms summed increases so, again informally, once the overshoot has passed by a particular x, convergence at that value of x is possible.


The Haar System.
================

In mathematics, the Haar wavelet is a sequence of rescaled "square-shaped" functions which together form a wavelet family or basis. Wavelet analysis is similar to Fourier analysis in that it allows a target function over an interval to be represented in terms of an orthonormal basis. The Haar sequence is now recognized as the first known wavelet basis

The Haar Scaling Functions and the Haar Functions.
--------------------------------------------------

**Definition:** Let *p*(*x*) = *X*<sub>\[0.1)</sub>(*x*), and for each *j*.*k* ∈ **Z**, define *p*<sub>*j*.*k*</sub>(*x*) = 2<sup>*j*/2</sup>*p*(2<sup>*j*</sup>,*r*−*k*) = *D*<sub>2</sub>, *T*<sub>*k*</sub>*p*(*x*).

The collection {*p*<sub>*j*, *k*</sub>(*x*)}<sub>t. *k* ∈ **Z**</sub> is
referred to as the system of Haar scaling function. For each
*j* ∈ **Z**. the collection {*p*<sub>1, *k*</sub>(*x*)}<sub>*k* ∈ **Z**</sub> is referred to as the system of scale *j* Haar scaling functions. Let
*h*(*x*) = *χ*<sub>\[0, 1/2)</sub>(*x*) − *χ*<sub>\[1/2, 1\]</sub>(*x*),
and for each *j*, *k* ∈ **Z**, define

*h*<sub>*j*, *k*</sub>(*x*) = 2<sup>*J*/2</sup>*h*(2<sup>*j*</sup>*x*−*k*) = *D*<sub>2<sup>*j*</sup></sub>*T*<sub>*k*</sub>*h*(*x*) The collection {*h*<sub>*j*, *k*</sub>(*x*)}<sub>*j*, *k* ∈ **Z**</sub> is referred to as the Haar system on **R**. For each *j* ∈ **Z**, the collection {*h*<sub>*J*, *k*</sub>(*x*)}<sub>*k* ∈ **Z**</sub> is
referred to as the system of scale *j* Haar functions.

**Properties:**

-   For each *j*.*k* ∈ **Z**, *p*<sub>*j*.*k*</sub>(*x*) = 2<sup>*j*/2</sup>*l*<sub>*I <sub>*j*.*k*</sub></sub>(*x*). so that *p*<sub>*j*.*k*</sub>(*x*) is supported on the interval *I*<sub>*j*.*k*</sub> and does not vanish on that interval. 
Therefore, we refer to the scaling function *p*<sub>*j*.*k*</sub>(.*r*) as being associated with the interval *I*<sub>*j*, *k*</sub>.

-   For each *j*, *k* ∈ **Z** 

![equation](http://latex.codecogs.com/gif.latex?%5Cint_%7B%5Cmathbf%7BR%7D%7D%20p_%7Bj%2C%20k%7D%28x%29%20d%20x%3D%5Cint_%7BI_%7Bj%2C%20k%7D%7D%20p_%7Bj%2C%20k%7D%28x%29%20d%20x%3D2%5E%7B-j%20%2F%202%7D)
and  
![equation](http://latex.codecogs.com/gif.latex?%5Cint_%7B%5Cmathbf%7BR%7D%7D%5Cleft%7Cp_%7Bj%2C%20k%7D%28x%29%5Cright%7C%5E%7B2%7D%20d%20x%3D%5Cint_%7BI_%7Bj%2C%20k%7D%7D%5Cleft%7Cp_%7Bj%2C%20k%7D%28x%29%5Cright%7C%5E%7B2%7D%20d%20x%3D1)

The Haar Bases on \[0,1\].
--------------------------

For any integer *J* ≥ 0, the scale *J* Haar system on \[0, 1\] is the collection

![equation](http://latex.codecogs.com/gif.latex?%5Cleft%5C%7Bp_%7BJ%2C%20k%7D%28x%29%3A%200%20%5Cleq%20k%20%5Cleq%202%5E%7BJ%7D-1%5Cright%5C%7D%20%5Ccup%5Cleft%5C%7Bh_%7BJ%2C%20k%7D%28x%29%3A%20j%20%5Cgeq%20J%20%3B%200%20%5Cleq%20k%20%5Cleq%202%5E%7BJ%7D-1%5Cright%5C%7D)

When *J* = 0, this collection will be referred to simply as the Haar system on \[0, 1\].

\(a\) The Haar system on \[0, 1\] consists of precisely those Haar functions *h*<sub>*j*, *k*</sub>(*x*) corresponding to dyadic intervals *I*<sub>*j*, *k*</sub> that are sub- sets of \[0, 1\], together with the single scaling function *p*<sub>0, 0</sub>(*x*)

\(b\) For *J* &gt; 0, the scale *J* Haar system on \[0, 1\] consists of precisely those Haar functions *h*<sub>*j*, *k*</sub>(*x*) corresponding to dyadic intervals *I*<sub>*j*.*k*</sub> for which *j*≥ *J* and that are subsets of \[0, 1\], together with those scale *J* Haar scaling functions that are supported in \[0, 1\].

![haar_basis](/media/Haar_Basis.PNG)


Approximate and Detailed Operators.
-----------------------------------

**Definition:** For each *j* ∈ **Z**, define the approximation operator
*P*<sub>*j*</sub> on functions *f*(*x*), *L*<sup>2</sup> on
**R**, *b**y*

![equation](http://latex.codecogs.com/gif.latex?P_%7BJ%7D%20f%28x%29%3D%5Csum_%7Bk%7D%5Cleft%5Clangle%20f%2C%20p_%7BJ%2C%20k%7D%5Cright%5Crangle%20p_%7B%5Cjmath%2C%20k%7D%28x%29%0A)

\(a\) For each *j* ∈ **Z**, define the approximation space
*V*<sub>*j*</sub> by

![equation](http://latex.codecogs.com/gif.latex?V_%7Bj%7D%3D%5Coverline%7B%5Coperatorname%7Bspan%7D%7D%5Cleft%5C%7Bp_%7B%5Cjmath%2C%20k%7D%28x%29%5Cright%5C%7D_%7Bk%20%5Cin%20%5Cmathbf%7BZ%7D%7D%0A)

since {*p*<sub>ȷ, *k*</sub>(*x*):*k*∈**Z**} is an orthonormal system on
**R** ∈ **Z**. that *P*<sub>*j*</sub>*f*(*x*) is the function in
*V*<sub>*j*</sub> best approximating *f*(*x*) in the *L*<sup>2</sup>
sense.

\(b\) since
*p*<sub>*j*, *k*</sub>(*x*) = 2<sup>*j*/2</sup>*χ*<sub>*I*<sub>*j*, *k*</sub></sub>(*x*)

![equation](http://latex.codecogs.com/gif.latex?%5Cqquad%5Cleft%28f%2C%20p_%7Bj%2C%20k%7D%5Cright%29%20p_%7Bj%2C%20k%7D%28x%29%3D%5Cleft%282%5E%7Bj%7D%20%5Cint_%7BI_%7Bj%2C%20k%7D%7D%20f%28t%29%20d%20t%5Cright%29%20%5Cchi_%7BI_%7Bj%2C%20k%7D%7D%28x%29%20%0A)

In other words, on the interval
*I*<sub>*j*, *k*</sub>, *P*<sub>*j*</sub>*f*(*x*) is the average value
of *f*(*x*) on *I*<sub>*J*, *k*</sub>

**Definition:** For each *j* ∈ **Z**, define the detail operator
*Q*<sub>*j*</sub> on functions *f*(*x*), *L*<sup>2</sup> on
**R**, by

![equation](http://latex.codecogs.com/gif.latex?Q_%7Bj%7D%20f%28x%29%3DP_%7Bj%2B1%7D%20f%28x%29-P_%7Bj%7D%20f%28x%29%20%0A)

![Gibbs Phenomenon](/media/PxQxFx.png)
(a) Approximate Operator of Second Degree Hat function, (b) Approximate Operator of Second Degree Hat function, (c) Detailed Operator of Second Degree Hat function, (d)Approximation of Second Degree Hat function Using Haar Basis.

\(a\) For each *j* ∈ **Z**, we define the wavelet space
*W*<sub>*j*</sub> by 

![equation](http://latex.codecogs.com/gif.latex?W_%7Bj%7D%3D%5Coverline%7B%5Coperatorname%7Bspan%7D%7D%5Cleft%5C%7Bh_%7BJ%2C%20k%7D%28x%29%5Cright%5C%7D_%7Bk%20%5Cin%20%5Cmathbf%7BZ%7D%7D%0A)

since {*h*<sub>*j*, *k*</sub>(*x*)}<sub>*k* ∈ **Z**</sub> is an orthonormal system on **R** and in light of ( 5.12) Lemma 2.51 implies that *Q*<sub>*j*</sub>*f*(*x*) is the function in *W*<sub>*j*</sub> best approximating *f*(*x*) in the *L*<sup>2</sup> sense.

\(b\) In light of the interpretation of *P*<sub>*j*</sub>*f*(*x*) as the blurred version of *f*(*x*) at scale 2<sup> − *j*</sup>, we can interpret *Q*<sub>*j*</sub>*f*(*x*) as containing those features of *f*(*x*) that are of size smaller than 2<sup> − *J*</sup> but larger than 2<sup> − ȷ − 1</sup>. That is, *Q*<sub>*j*</sub>*f*(*x*) has those details invisible to the approximation *P*<sub>*j*</sub>*f*(*x*) but visible to the approximation *P*<sub>*J* + 1</sub>*f*(*x*).

The Discrete Haar Transform in 1 Dimension.
===========================================

Motivation.
-----------

A function *f*(*x*) (defined on \[ 0.1\] his an expansion in terms of Haar functions as follows. Give that any integer *J* ≥ 0.

![equation](http://latex.codecogs.com/gif.latex?W_%7Bj%7D%3D%5Coverline%7B%5Coperatorname%7Bspan%7D%7D%5Cleft%5C%7Bh_%7BJ%2C%20k%7D%28x%29%5Cright%5C%7D_%7Bk%20%5Cin%20%5Cmathbf%7BZ%7D%7Df%28x%29%3D%5Csum_%7Bj%3DJ%7D%5E%7Bx%7D%20%5Csum_%7Bk%3D0%7D%5E%7B2%5E%7B%5Cprime%7D-1%7D%5Cleft%5Clangle%20f%20%5Ccdot%20h_%7Bj%20%5Ccdot%20k%7D%5Cright%5Crangle%20h_%7BJ%2C%20k%7D%20%5Ccdot%28x%29%2B%5Csum_%7Bk%3D0%7D%5E%7B2%5E%7B%5Cprime%7D-1%7D%5Cleft%5Clangle%20f%20%5Ccdot%20p_%7BJ%2C%20k%7D%5Cright%5Crangle%20p_%7BJ%2C%20k%7D%28x%29)


in *L*<sup>2</sup> on \[0.1\]

Thus. the Haar coefficients of *f*(*x*) can be approximated by the Haar coefficients of *P*<sub>*N*</sub>*f*(*x*). That is.

![equation](http://latex.codecogs.com/gif.latex?%5Cleft%5Clangle%20f%20.%20h_%7BJ%20.%20k%7D%5Cright%5Crangle%20%5Capprox%5Cleft%5Clangle%20P_%7BN%7D%20f%20.%20h_%7BJ%20.%20k%7D%5Cright%5Crangle%20%5Cquad%20%5Ctext%20%7B%20and%20%7D%20%5Cquad%5Cleft%5Clangle%20f%2C%20p_%7BJ%20.%20k%7D%5Cright%5Crangle%20%5Capprox%5Cleft%5Clangle%20P_%7BN%7D%20f%2C%20p_%7BJ%20.%20k%7D%5Cright%5Crangle)


Derivation.
-----------

Suppose that we are given a finite sequence of data of length 2<sup>*N*</sup> for some
*N* ∈ **N**.{*c*<sub>0</sub>(*k*)}<sub>*k* = 0</sub><sup>2</sup> − 1. We assume that for some underlying function *f*(*x*) *c*<sub>0</sub>(*k*) = ⟨*f*⋅*p*<sub>*N*, *k*</sub>⟩. Fix *J* ∈ **N**.*J* &lt; *N*. and for each 1 ≤ *j* ≤ *J*, define,

*c*<sub>*j*</sub>(*k*) = ⟨*f*,*p*<sub>*N* − *j*, *k*</sub>⟩   and *d*<sub>*j*</sub>(*k*) = ⟨*f*.*h*<sub>*N* − *j*..⟩</sub>⟩

It turns out that there is a convenient recursive algorithm that can be used to compute the coefficients *c*<sub>*j*</sub>(*k*) and *d*<sub>*j*</sub>(*k*) from *c*<sub>*j* − 1</sub>(*k*)..

![equation](http://latex.codecogs.com/gif.latex?%5Cbegin%7Baligned%7D%20c_%7Bj%7D%28k%29%20%26%3D%5Cleft%5Clangle%20f%2C%20p_%7BN%7D-%2C%20.%20k%5Cright%5Crangle%20%5C%5C%20%26%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%5Cleft%5Clangle%20f%2C%20p_%7BN%7D-j%2B1.2%20k%5Cright%5Crangle%2B%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%5Cleft%5Clangle%20f%20%5Ccdot%20p_%7BN%7D-j%2B1%2C2%20k%2B1%5Cright%5Crangle%20%5C%5C%20%26%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%20c_%7BJ-1%7D%282%20k%29%2B%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%20c_%7BJ-1%7D%282%20k%2B1%29%20%5C%5C%20%26%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%20c_%7Bj-1%7D%282%20k%29-%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%20c_%7Bj-1%7D%282%20k%2B1%29%20%5Cend%7Baligned%7D)

![equation](http://latex.codecogs.com/gif.latex?d_%7Bj%7D%28k%29%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%20c_%7Bj-1%7D%282%20k%29-%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%20c_%7Bj-1%7D%282%20k%2B1%29)

By writing in Matrix form,

![equation](http://latex.codecogs.com/gif.latex?%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7Bc_%7Bj%7D%28k%29%7D%20%5C%5C%20%7Bd_%7Bj%7D%28k%29%7D%5Cend%7Barray%7D%5Cright%29%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%5Cleft%28%5Cbegin%7Barray%7D%7Bcc%7D%7B1%7D%20%26%20%7B1%7D%20%5C%5C%20%7B1%7D%20%26%20%7B-1%7D%5Cend%7Barray%7D%5Cright%29%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7Bc_%7Bj-1%7D%5Cleft%282%20k_%7Bi%7D%5Cright%29%7D%20%5C%5C%20%7Bc_%7Bj-1%7D%282%20k%2B1%29%7D%5Cend%7Barray%7D%5Cright%29)

![equation](http://latex.codecogs.com/gif.latex?%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7Bc_%7Bj-1%7D%282%20k%29%7D%20%5C%5C%20%7B%5Cleft%28%5Ccdot_%7Bj-1%7D%282%20k%2B1%29%5Cright.%7D%5Cend%7Barray%7D%5Cright%29%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%5Cleft%28%5Cbegin%7Barray%7D%7Bcc%7D%7B1%7D%20%26%20%7B1%7D%20%5C%5C%20%7B1%7D%20%26%20%7B-1%7D%5Cend%7Barray%7D%5Cright%29%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7Bc_%7Bj%7D%28k%29%7D%20%5C%5C%20%7Bd_%7Bj%7D%28k%29%7D%5Cend%7Barray%7D%5Cright%29)

As with the DFT, the DHT can be thought of as a linear transformation on a finite-dimensional space and as such can be written as multiplication by a matrix.
Given *L* ∈ **N** even, define the (*L*/2) × *L* matrices *H*<sub>*L*</sub> and *G*<sub>*L*</sub> by:

![equation](http://latex.codecogs.com/gif.latex?H_%7BL%7D%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%5Cleft%28%5Cbegin%7Barray%7D%7Bcccccc%7D%7B1%7D%20%26%20%7B1%7D%20%26%20%7B0%7D%20%26%20%7B%7D%20%26%20%7B%5Ccdots%7D%20%26%20%7B0%7D%20%5C%5C%20%7B0%7D%20%26%20%7B0%7D%20%26%20%7B1%7D%20%26%20%7B1%7D%20%26%20%7B0%7D%20%26%20%7B%5Ccdots%7D%20%26%20%7B0%7D%20%5C%5C%20%7B%7D%20%26%20%7B%7D%20%26%20%7B%7D%20%26%20%7B%5Cvdots%7D%20%26%20%7B%7D%20%5C%5C%20%7B0%7D%20%26%20%7B%7D%20%26%20%7B%5Ccdots%7D%20%26%20%7B%7D%20%26%20%7B0%7D%20%26%20%7B1%7D%20%26%20%7B1%7D%5Cend%7Barray%7D%5Cright%29)

![equation](http://latex.codecogs.com/gif.latex?G_%7BL%7D%3D%5Cfrac%7B1%7D%7B%5Csqrt%7B2%7D%7D%5Cleft%28%5Cbegin%7Barray%7D%7Bcccccc%7D%7B1%7D%20%26%20%7B-1%7D%20%26%20%7B0%7D%20%26%20%7B%7D%20%26%20%7B%5Ccdots%7D%20%26%20%7B0%7D%20%5C%5C%20%7B0%7D%20%26%20%7B0%7D%20%26%20%7B1%7D%20%26%20%7B-1%7D%20%26%20%7B0%7D%20%26%20%7B%5Ccdots%7D%20%26%20%7B0%7D%20%5C%5C%20%7B%7D%20%26%20%7B%7D%20%26%20%7B%7D%20%26%20%7B%5Cvdots%7D%20%5C%5C%20%7B0%7D%20%26%20%7B%7D%20%26%20%7B%5Ccdots%7D%20%26%20%7B%7D%20%26%20%7B0%7D%20%26%20%7B1%7D%20%26%20%7B-1%7D%5Cend%7Barray%7D%5Cright%29)


Define the *L* × *L* matrix 𝒲<sub>*L*</sub> by

![equation](http://latex.codecogs.com/gif.latex?%5Cmathcal%7BW%7D_%7BL%7D%3D%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7BH_%7BL%7D%7D%20%5C%5C%20%7BG_%7BL%7D%7D%5Cend%7Barray%7D%5Cright%29)

The matrix *H*<sub>*L*</sub> is referred to as the approximation matrix,
the matrix *G*<sub>*L*</sub> as the detail matrix, and the matrix
𝒲<sub>*L*</sub> as the wavelet matrix.

Algorithms for DHT and IDHT
---------------------------

**Discrete Haar Transform:** Given *J*, *N* ∈ **N** with *J* &lt; *N*
and a vector

![equation](http://latex.codecogs.com/gif.latex?%5Cmathbf%7Bc%7D_%7B0%7D%3D%5Cleft%28c_%7B0%7D%280%29%20c_%7B0%7D%281%29%20%5Ccdots%20c_%7B0%7D%5Cleft%282%5E%7BN%7D-1%5Cright%29%5Cright%29)


of length 2<sup>*N*</sup>, the *D**H**T* of **c**<sub>0</sub> is the
vector

![equation](http://latex.codecogs.com/gif.latex?%5Cleft%28%5Cbegin%7Barray%7D%7Bll%7D%7Bd_%7B1%7D%7D%20%26%20%7Bd_%7B2%7D%7D%5Cend%7Barray%7D%20%5Ccdots%20d_%7BJ%7D%20c_%7BJ%7D%5Cright%29%0A)

where,

![equation](http://latex.codecogs.com/gif.latex?%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7B%5Cmathbf%7Bc%7D_%7BJ%7D%7D%20%5C%5C%20%7B%5Cmathbf%7Bd%7D_%7Bj%7D%7D%5Cend%7Barray%7D%5Cright%29%3D%5Cleft%28%5Cbegin%7Barray%7D%7Bc%7D%7BH%7D%20%5C%5C%20%7BG%7D%5Cend%7Barray%7D%5Cright%29%20%5Cmathbf%7Bc%7D_%7B%5Cjmath-1%7D%0A%0A)

![Tree diagram](/media/Tree.PNG)
Tree Diagram for The DHT.

 Comparison of Discrete Haar Wavelet Transform with Discrete Cosine Transform.
-----------------------------------------------------------------------------

As shown in the figure,the lossy compression is performed on the given
discrete signal by using discrete Haar transform (DHT) and by using
discrete cosine transform (DCT).

<figure>
<img src="/media/dht.png" id="fig:dht_dct" alt="(a) Original Discrete Signal, (b) DHT of the Signal, (c) DCT of the Signal,(d) IDHT of Compressed Signal, (e) IDCT of Compressed Signal." /><figcaption aria-hidden="true">(a) Original Discrete Signal, (b) DHT of the Signal, (c) DCT of the Signal,(d) IDHT of Compressed Signal, (e) IDCT of Compressed Signal.</figcaption>
</figure>

As we can see, the information at the discontinuity in the original
signal is sustained by the DHT method whereas, it is smoothed out in the
case of DCT method.

Image Compression Using Discrete Haar Wavelet Transform.
========================================================

As shown in the figure below, the Discrete Haar Wavelet Transform and
The Discrete Cosine Transforms are taken. As most of the pixel values
are near to the zero (i.e. black), image can be compressed by setting
those values to zero.

<figure>
<img src="/media/LionDCTDHT.PNG" id="fig:imgdctdht" alt="(a) Original Image, (b) DHT of the Image, (c) DCT of the Image." /><figcaption aria-hidden="true">(a) Original Image, (b) DHT of the Image, (c) DCT of the Image.</figcaption>
</figure>

Hence, by applying lossy compression on the Discrete Cosine Transform of
the image, The Inverse Discrete Cosine Transform of the compressed
images are given by:

<figure>
<img src="/media/LionDCTcmp.PNG" id="fig:imgdct" alt="(a) 97% compressed using DCT, (b) 99% compressed using DCT, (c) 99.99% compressed using DCT." /><figcaption aria-hidden="true">(a) 97% compressed using DCT, (b) 99% compressed using DCT, (c) 99.99% compressed using DCT.</figcaption>
</figure>

Similarly, applying lossy compression on the Discrete Haar Transform of
the image, The Inverse Discrete Haar Transform of the compressed images
are given by:

<figure>
<img src="/media/LionDHTcmp.PNG" id="fig:imgdht" alt="(a) 97% compressed using DHT, (b) 99% compressed using DHT, (c) 99.99% compressed using DHT." /><figcaption aria-hidden="true">(a) 97% compressed using DHT, (b) 99% compressed using DHT, (c) 99.99% compressed using DHT.</figcaption>
</figure>

Conclusions.
============

The normalized version of the Haar wavelet offers greater compression,
and yields better-looking results compared to the standard one. This is
due to the properties of orthogonal matrices. The variant that
implements loops to perform the normalization in the Haar wavelet
transformation process is better in terms of algorithm complexity
compared to the variant that generates the required Haar matrices and
performs matrix multiplication. Throughout this project, we focused on
the Haar wavelet transform as a window to better understanding the
different compression processes since they boil down to the same
essence. Thus, this research and implementation have been useful in
terms of gaining a lot of insight into the field of image compression
and its application of mathematical concepts

REFERENCES
==========

1.  \] Walnut, David *F*. An introduction to wavelet analysis / David F.
    Walnut p. cm. (Applied and numerical harmonic analysis) Includes
    bibliographical references and index. ISBN 0 − 8176 − 3962 − 4 (alk.
    paper).

2.  \] Stéphane Mallat, a Wavelet tour of signal processing,The Sparse
    Way,ISBN 13 : 9780 − 12 − 374370 − 1.

3.  \] A. Haar. Zur theorie der orthogonalen funktionensysteme. Math.
    Annal., 69:331–371, 1910.

