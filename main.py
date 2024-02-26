######  PROGRAM MEMANGGIL WINDOWS PYQT5 ##########################

####### memanggil library PyQt5 ##################################
#----------------------------------------------------------------#
from PyQt5.QtCore import * 
from PyQt5.QtGui import * 
from PyQt5.QtQml import * 
from PyQt5.QtWidgets import *
from PyQt5.QtQuick import *  
import sys
import control
#----------------------------------------------------------------#
numerator = [0, 0, 0, 0, 0]
denumerator = [0, 0, 0, 0, 0]
a_matrix = []
b_matrix = []
c_matrix = []
d_matrix = []

########## mengisi class table dengan instruksi pyqt5#############
#----------------------------------------------------------------#
class table(QObject):    
    def __init__(self, parent = None):
        super().__init__(parent)
        self.app = QApplication(sys.argv)
        self.engine = QQmlApplicationEngine(self)
        self.engine.rootContext().setContextProperty("backend", self)    
        self.engine.load(QUrl("main.qml"))
        sys.exit(self.app.exec_())
        
    @pyqtSlot(str, str, str, str, str,str, str, str, str, str)
    def solver(self, num1, num2, num3, num4, num5, den1, den2, den3, den4, den5):
        global numerator
        global a_matrix
        global b_matrix
        global c_matrix
        global d_matrix
        a_matrix = []
        b_matrix = []
        c_matrix = []
        d_matrix = []
        print(num1, num2, num3, num4, num5)
        print("---------------------------")
        print(den1, den2, den3, den4, den5)
        numerator[0] = float(num1)
        numerator[1] = float(num2)
        numerator[2] = float(num3)
        numerator[3] = float(num4)
        numerator[4] = float(num5)
        
        denumerator[0] = float(den1)
        denumerator[1] = float(den2)
        denumerator[2] = float(den3)
        denumerator[3] = float(den4)
        denumerator[4] = float(den5)
        print(numerator, denumerator)
        Gtf = control.tf(numerator, denumerator)
        print(Gtf)
        Gss = control.ss(Gtf)
        print("A matrix:")
        a_matrix = (Gss.A).tolist()
        print(a_matrix)
        print("B matrix:")
        b_matrix = (Gss.B).tolist()
        print(b_matrix)
        print("C matrix:")
        c_matrix = (Gss.C).tolist()
        print(c_matrix)
        print("D matrix:")
        d_matrix = (Gss.D).tolist()
        print(d_matrix)
    
    @pyqtSlot(str)
    def clear(self, val):
        global a_matrix
        a_matrix.clear()
        b_matrix.clear()
        c_matrix.clear()
        d_matrix.clear()
    
    
    @pyqtSlot(result=list)
    def array_a(self):  return (a_matrix)
    
    @pyqtSlot(result=list)
    def array_b(self):  return (b_matrix)
    
    @pyqtSlot(result=list)
    def array_c(self):  return (c_matrix)
    
    @pyqtSlot(result=list)
    def array_d(self):  return (d_matrix)
        
#----------------------------------------------------------------#

########## memanggil class table di mainloop######################
#----------------------------------------------------------------#    
if __name__ == "__main__":
    main = table()
    
    
#----------------------------------------------------------------#