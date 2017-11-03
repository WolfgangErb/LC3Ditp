# LD3Ditp
Trivariate polynomial interpolation on general Lissajous-Chebyshev nodes
--------------------------------------------------------------------------------

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<img src="img/Lissajous3D.jpg" width="350"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="img/indexset3D.png" width="370">

Version: 0.3 (01.10.2016)

Written by <a href="http://www.math.uni-luebeck.de/mitarbeiter/dencker/index.php"> Peter Dencker</a> and <a href="http://math.hawaii.edu/~erb/index.html"> Wolfgang Erb</a>


Description
-----------

The package LC3Ditp contains a Matlab implementation for trivariate polynomial interpolation on 
general Lissajous-Chebyshev points. This package syntesizes various interpolation schemes known in the literature. 


<br><br>

The general description of the Lissajous-Chebyshev nodes and the polynomial interpolation is provided in the article [1]. 

- To **test** the package use **main_example.m**

- To **plot** the node points and the spectra use **plot_LC3Dpts.m**

<br><br>

<img src="img/testfun1.jpg" width="400"> &nbsp;&nbsp;&nbsp; <img src="img/testfun2.jpg" width="400">

As special cases it contains the following interpolation schemes:

- The 3D Morrow-Patterson-Xu points for the frequency parameters (m,m,m) [2].
- Interpolation schemes based on single degenerate Lissajous curves for 
the frequency parameter (n,m,p), where n,m and p are relatively prime numbers [3]. 


Citation and Credits
--------------------

The theory for this code was developed by Peter Dencker (Institute of Mathematics, University of Luebeck) and Wolfgang Erb (Department of Mathematics, University of Hawaii at Manoa). The general construction of the interpolation
scheme is given in


*   [1] &nbsp; Dencker, P. and Erb, W. <br>
    <i> A unifying theory for multivariate polynomial interpolation on general Lissajous-Chebyshev nodes </i> <br>
    arXiv:1711.00557v1 [math.NA] (2017) 


Further references

*   [2] &nbsp; Dencker, P. and Erb, W. <br>
    <i> Multivariate polynomial interpolation on Lissajous-Chebyshev nodes </i> <br>
    J. Approx. Theory 219 (2017), 15-45

*   [3] &nbsp; De Marchi, S., Vianello, M. and Xu, Y. <br>
    <i> New cubature formulae and hyperinterpolation in three variables </i> <br>
    BIT 49 (1) (2009), 55–73.
       

The file plotregion.m was written by Per Bergström 2006-01-16. In this package it is used as 
an auxiliary program in plot_LC3Dpts.m to plot the polygonal boundary of the index sets. 

License
-------

Copyright (C) 2016 Peter Dencker, Wolfgang Erb

This software was written by Peter Dencker and Wolfgang Erb 
and developed at the University of Luebeck and the University of Hawaii

LC2Ditp is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
