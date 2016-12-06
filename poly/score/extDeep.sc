// +Array{
// 	deepSelect { arg depth = 1, function, index = 0, rank = 0;
// 		if(depth.isNil) {
// 			rank = rank + 1;
// 			^this.do { |item, i| item.deepDo(depth, function, i, rank) }
// 		};
// 		if (depth <= 0) {
// 			function.value(this, index, rank);
// 			^this
// 		};
// 		depth = depth - 1;
// 		rank = rank + 1;
// 		^this.do { |item, i| item.deepDo(depth, function, i, rank) }
// 	}
// }