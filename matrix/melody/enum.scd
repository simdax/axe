(
noRep: { |x,i,col| col[(0..i-1)].includes(x).not },
subSets:{ |x,i,col,icol| icol[i] > icol[i-1] },
sameShape:{{ |x,i,col|
	col[(0..i-1)].includes(x).not && ((x - col[i-1]).sign == d[i])
}},


)