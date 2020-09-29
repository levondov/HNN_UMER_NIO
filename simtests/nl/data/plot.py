import numpy as np
import matplotlib.pyplot as plt

dat = np.load('dat.npy')
s = np.linspace(0,11.52,len(dat[0]))
tx = dat[2][-1]/(2*np.pi)
ty = dat[3][-1]/(2*np.pi)

# calc phases from 0-2pi
for i in range(len(dat[0])):
    while dat[2][i] > 2*np.pi:
        dat[2][i] = dat[2][i]-2*np.pi
    while dat[3][i] > 2*np.pi:
        dat[3][i] = dat[3][i]-2*np.pi

plt.figure()


plt.subplot(2,1,1)
plt.plot(s,dat[0],label='beta x')
plt.plot(s,dat[1],label='beta y')
plt.title('qx= '+str(tx)+' | ' +'qy= '+str(ty))
plt.subplot(2,1,2)
plt.plot(s,dat[2]/np.pi,label='phase x')
plt.plot(s,dat[3]/np.pi,label='phase y')


plt.show()
