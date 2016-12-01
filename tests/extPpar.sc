MyPtpar : Ptpar{
	var priorityQ;
	
		embedInStream { arg inval;
		var assn;
		priorityQ = PriorityQueue.new;

		repeats.value(inval).do({ arg j;
			var outval, stream, nexttime, now = 0.0;

			this.initStreams(priorityQ);

			// if first event not at time zero
			if (priorityQ.notEmpty and: { (nexttime = priorityQ.topPriority) > 0.0 }) {
				outval = Event.silent(nexttime, inval);
				inval = outval.yield;
				now = nexttime;
			};

			while { priorityQ.notEmpty } {
				stream = priorityQ.pop;
				outval = stream.next(inval).asEvent;
				if (outval.isNil) {
					nexttime = priorityQ.topPriority;
					if (nexttime.notNil, {
						// that child stream ended, so rest until next one
						outval = Event.silent(nexttime - now, inval);
						inval = outval.yield;
						now = nexttime;
					},{
						priorityQ.clear;
					});
				} {
					// requeue stream
					priorityQ.put(now + outval.delta, stream);
					nexttime = priorityQ.topPriority;
					outval.put(\delta, nexttime - now);

					inval = outval.yield;
					// inval ?? { this.purgeQueue(priorityQ); ^nil.yield };
					now = nexttime;
				};
			};
		});
		^inval;
	}

	put{ arg time, pattern;
		list=list++[time, pattern];
		this.initStreams(priorityQ);
	}	
}