
~regLineCalculate = {
	arg data;
	var sx = 0, sy = 0, sxy = 0, sx2 = 0, n;
	n = data.size;
	//data.postln;
	sx = n * (n - 1) /2;
	sy = data.sum;
	sx2 = (1..(n-1)).squared.sum;
	sxy = data.collect({ |y, x| x * y }).sum;
	((n * sxy) - (sx * sy)) / ((n * sx2) - (sx * sx));
};

~regLineCalculate.(Array.rand(20,1,3).postln.integrate.addFirst(0))