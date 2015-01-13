using Goheer.EXIF;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PostProcessing
{
    class EXIFEdit
    {
        public Bitmap bmp = null;
        public EXIFextractor er = null;
        public Encoding ascii = Encoding.ASCII;
        public String CreateTime = null;
        public int hour, minute, second;

        private static int COMMENT = 0x9286;

        public EXIFEdit(String picPath)
        {
            bmp = new Bitmap(picPath);
            er = new EXIFextractor(ref bmp, "\n");
            CreateTime = (String)er["Date Time"];
            CreateTime = CreateTime.Substring(CreateTime.IndexOf(' '));
            CreateTime = CreateTime.Substring(1);
            hour = Convert.ToInt16(CreateTime.Substring(0,2));
            minute = Convert.ToInt16(CreateTime.Substring(3, 2));
            second = Convert.ToInt16(CreateTime.Substring(6, 2));
            //MessageBox.Show(hour + " " + minute + " " + second);
        }
        public void writeGPSToComment(String GPSCoord)
        {
            er.setTag(COMMENT, GPSCoord);
        }




    }
}
