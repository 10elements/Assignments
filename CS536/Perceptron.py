__author__ = 'Dimitri Zhang'
import numpy as np

def loadData(fileName, num):
	dataMat = np.zeros((num, 255), dtype = np.float64 )
	count = 0
	f = open(fileName, 'r')
	for line in f:
		l = line.split()
		dataMat[count, 0] = l[0]
		for c in l[1:]:
			pair = c.split(':')
			dataMat[count, int(pair[0])] = pair[1]
			count += 1
			if count == num:
				break
	return dataMat

dataMat = loadData('~/Documents/MachineLearning/HW2/webspam.svm', 2)
print(dataMat[1,:])