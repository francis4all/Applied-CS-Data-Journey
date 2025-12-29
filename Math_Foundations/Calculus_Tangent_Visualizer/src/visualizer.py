import matplotlib.pyplot as plt
import numpy as np

def pendiente(x, r, h):
        return -(x-h)/np.sqrt(r**2-(x-h)**2)
    
def recta(m, x, x0, y0):
    return m*(x-x0)+y0

h = float(input('Ingrese la coordenada X del centro de la circunferencia: '))
k = float(input('Ingrese la coordenada Y del centro de la circunferencia: '))
r = float(input('Ingrese tamaño del radio de la circunferencia: '))
while r <= 0:
    r = float(input('Ingrese un valor positivo y distinto de 0 para el radio: '))
cx = float(input('Ingrese coordenada en X: '))
    
x2 = h + r
y2 = k + r

#----------Trazado de la circunferencia con la ecuacion parametrica--------#
figure, axes = plt.subplots(1) 
angle = np.linspace(0, 2 * np.pi , 150) 
  
x = r * np.cos(angle) 
y = r * np.sin(angle) 
  
axes.plot(x+h, y+k) 
axes.set_aspect(1) 
 #-----------------------------------------------------------------------#
plt.axis([h-1, x2+r, k-1, y2+r]) 
plt.xlabel('eje X')
plt.ylabel('eje Y')

plt.plot(h, k, ".", color = 'k') #Centro de la circunferencia
plt.hlines(k, h, x2, color = 'orange') #Radio horizontal
plt.vlines(h, k, y2, color = 'orange') #Radio vertical

if cx > x2 or cx < h:
    print('La coordenada en X no pertenece al segmento del cuadrante 1 de la circunferencia')
    plt.plot(cx, k, ".", color = 'r') #Coordenada en x
    
else:
    if cx == h:
        print('La coordenada en Y correspondiente es: ')
        cy = y2
        print(cy)
        
    elif cx == x2:
        print('La coordenada en Y correspondiente es: ')
        cy = k
        print(cy)
    
    else:
        print('La coordenada en Y correspondiente es: ')
        cy = (np.sqrt((r**2)-((cx-h)**2)))+k   
        print(cy)

    plt.vlines(cx, k, cy, color = 'limegreen') #Cuerda desde (cx, k) hasta (cx, cy)
    plt.hlines(cy, h, cx, color = 'limegreen') #Cuerda desde (h, cy) hasta (cx, cy)
    plt.plot(cx, cy, ".", color = 'purple') #Coordenada en y
    plt.plot(cx, k, ".", color = 'red') #Coordenada en x

    if cx != x2:
        m = pendiente(cx, r, h)
        xl = h - r
        xr = x2 + r
        yl = recta(m, xl, cx, cy)
        yr = recta(m, xr, cx, cy)
        plt.plot([xl, xr],[yl, yr], color = 'dimgray')
    else:
        xl = x2
        xr = x2
        yl = k + r
        yr = k - r
        plt.plot([xl, xr],[yl, yr], color = 'dimgray')
        
plt.gca().set_aspect('equal')
plt.grid() #Traza el cuadriculado
plt.show() #Hace que aparezcan los graficos
