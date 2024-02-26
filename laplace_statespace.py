#import library
import control
import numpy as np

#deklarasi variabel
b = [0, 0, 0, 3]
a = [0,0, 0, 0, 1]
print(control.tf(b, a))

#memasukkan persamaan laplace b numerator dan a denumerator
Gtf = control.tf(b, a)

#mengkonversi laplace ke state space
Gss = control.ss(Gtf)

#menampilkan hasil perhitungan konversi state space
print("A matrix:")
print(list(Gss.A))
print("B matrix:")
print(Gss.B)
print("C matrix:")
print(Gss.C)
print("D matrix:")
print(Gss.D)