using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PostProcessing
{
    class PathMetTime
    {
        public int hour, minute, second, millisecond, offset;
        public PathMetTime(int hour,int minute,int second, int millisecond) {
            this.hour = hour;
            this.second = second;
            this.minute = minute;
            this.millisecond = millisecond;
        }
        public long subtract(PathMetTime time) {//get time diff in milisecond. If 0:0:0.1  - 23:59:59.999  The answer wraps around
            long diff;
            diff=(this.hour * 3600 + this.minute * 60 + this.second) * 1000 + this.millisecond - (time.hour * 3600 + time.minute * 60 + time.second) * 1000 - time.millisecond;
            if (diff < 0) { diff += (24 * 3600000); }//wrap around
            return diff;
        }

        public void set_offset(int offset)
        {
            this.offset = offset;
        }
    }
}
