using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Threading;
using ZedGraph;
using SharpKml.Base;
using SharpKml.Dom;
using SharpKml.Engine;
using FC.GEPluginCtrls;


namespace PostProcessing
{
    public partial class Form1 : Form
    {
        String CSV_HEADER = "Laser(in), Encoder(R), Encoder(L), Timestamp(mS), RoughFlag, Acc(X), Acc(Y), Acc(Z), Gyro(X), Gyro(Y), Gyro(Z), Mag(X), Mag(Y), Mag(Z), Pitch(deg), Roll(deg), Yaw(deg)," +
                                        "GPS(UTC), GPS(mS), Lat(Deg), Long(Deg), Altitude(m), NumSatellites, GPSFixStatus, CameraTrigger" + Environment.NewLine;

        private Byte[] rawBytes;
        StringBuilder st;
        StringBuilder csvOutput;
        String csvOutputPath, GPSInputPath, RawFileInputPath, DSLRPath;


        List<String> parsedGPSLine = new List<string>();//save parsed GPS strings from one file

        //Planes
        //************************************meausrement vs. time  debug
        GraphPane TimeDiffPlane;
        GraphPane encoderTimePlane;
        GraphPane AccTimePlane;
        GraphPane GyroTimePlane;
        GraphPane MagTimePlane;
        GraphPane encoderDiffPlane;


        //********************************measurement vs. encoder   debug
        GraphPane AccEncoderPlane;
        GraphPane GyroEncoderPlane;
        GraphPane MagEncoderPlane;
        GraphPane laserEncoderPlane;
        GraphPane PitchEncoderPlane;
        GraphPane RollEncoderPlane;


        //Lists
        //************************************meausrement vs. time   output
        PointPairList listTimeDiff;
        PointPairList listREncodertime;
        PointPairList listIEncodertime;
        PointPairList listEncDiff;
        PointPairList AccxTime;
        PointPairList AccyTime;
        PointPairList AcczTime;
        PointPairList GyroxTime;
        PointPairList GyroyTime;
        PointPairList GyrozTime;
        PointPairList MagxTime;
        PointPairList MagyTime;
        PointPairList MagzTime;
        //********************************measurement vs. encoder  ouput
        PointPairList listLaseEnc;
        PointPairList PitchEncoder;
        PointPairList RollEncoder;
        PointPairList AccxEncoder;
        PointPairList AccyEncoder;
        PointPairList AcczEncoder;
        PointPairList GyroxEncoder;
        PointPairList GyroyEncoder;
        PointPairList GyrozEncoder;
        PointPairList MagxEncoder;
        PointPairList MagyEncoder;
        PointPairList MagzEncoder;

        private dynamic ge;
        private dynamic geSingle;


        public Form1()
        {
            InitializeComponent();
            //debug
            TimeDiffPlane = zedLaserTime.GraphPane;
            TimeDiffPlane.Title.Text = "Time vs Time difference";
            TimeDiffPlane.XAxis.Title.Text = "Time(ms)";
            TimeDiffPlane.YAxis.Title.Text = "diff(ms)";

            encoderTimePlane = zedEncoderTime.GraphPane;
            encoderTimePlane.Title.Text = "Encoder vs Time";
            encoderTimePlane.XAxis.Title.Text = "Time(ms)";
            encoderTimePlane.YAxis.Title.Text = "Encoder Pos";

            encoderDiffPlane = zedEncoderDiff.GraphPane;
            encoderDiffPlane.Title.Text = "Encoder vs Encoder Diff";
            encoderDiffPlane.XAxis.Title.Text = "Encoder Position";
            encoderDiffPlane.YAxis.Title.Text = "ticks";

            AccTimePlane = zedAccTime.GraphPane;
            AccTimePlane.Title.Text = "Acc vs Time";
            AccTimePlane.XAxis.Title.Text = "Time(ms)";
            AccTimePlane.YAxis.Title.Text = "g";

            GyroTimePlane = zedGyroTime.GraphPane;
            GyroTimePlane.Title.Text = "Gyro vs Time";
            GyroTimePlane.XAxis.Title.Text = "Time(ms)";
            GyroTimePlane.YAxis.Title.Text = "deg/s";

            MagTimePlane = zedMagTime.GraphPane;
            MagTimePlane.Title.Text = "Mag vs Time";
            MagTimePlane.XAxis.Title.Text = "Time(ms)";
            MagTimePlane.YAxis.Title.Text = "Units dont matter";

            //output
            laserEncoderPlane = zedLazerEncoder.GraphPane;
            laserEncoderPlane.Title.Text = "Laser vs Encoder pos";
            laserEncoderPlane.XAxis.Title.Text = "Encoder Pos";
            laserEncoderPlane.YAxis.Title.Text = "Laser(inch)";

            GyroEncoderPlane = zedGyro.GraphPane;
            GyroEncoderPlane.Title.Text = "Gyro vs enc";
            GyroEncoderPlane.XAxis.Title.Text = "Encoder Position";
            GyroEncoderPlane.YAxis.Title.Text = "deg/s";

            AccEncoderPlane = zedAcc.GraphPane;
            AccEncoderPlane.Title.Text = "Acc vs Enc";
            AccEncoderPlane.XAxis.Title.Text = "Encoder Position";
            AccEncoderPlane.YAxis.Title.Text = "g";

            PitchEncoderPlane = zedPitch.GraphPane;
            PitchEncoderPlane.Title.Text = "Pitch vs Encoder";
            PitchEncoderPlane.XAxis.Title.Text = "Encoder Position";
            PitchEncoderPlane.YAxis.Title.Text = "deg";
            RollEncoderPlane = zedRoll.GraphPane;
            RollEncoderPlane.Title.Text = "Roll vs Encoder";
            RollEncoderPlane.XAxis.Title.Text = "Encoder Position";
            RollEncoderPlane.YAxis.Title.Text = "deg";

            MagEncoderPlane = zedMag.GraphPane;
            MagEncoderPlane.Title.Text = "Mag vs Encoder";
            MagEncoderPlane.XAxis.Title.Text = "Encoder Position";
            MagEncoderPlane.YAxis.Title.Text = "units dont matter";

            // gMapControl1.
/*
            geWebBrowser1.LoadEmbeddedPlugin();
            geWebBrowser1.PluginReady += (o, e) =>
            {
                // ge can now be used exactly as it would be
                // in the native javascript api
                ge = e.ApiObject;
                ge.getOptions().setFlyToSpeed(4);
                // geWebBrowser1.FetchKml("http://localhost:8080/a.kml");         
            };

            geWebBrowserSingle.LoadEmbeddedPlugin();
            geWebBrowserSingle.PluginReady += (o, e) =>
            {
                // ge can now be used exactly as it would be
                // in the native javascript api
                geSingle = e.ApiObject;
                geSingle.getOptions().setFlyToSpeed(4);
                // geWebBrowser1.FetchKml("http://localhost:8080/a.kml");         
            };*/
        }
        private void addNewPlaceMark(double lat, double lng, double alt, dynamic ge)
        {
            var placemark = ge.createPlacemark("");
            placemark.setName("");
            // Define a custom icon.
            var icon = ge.createIcon("");
            icon.setHref("http://maps.google.com/mapfiles/kml/paddle/red-circle.png");
            var style = ge.createStyle("");
            style.getIconStyle().setIcon(icon);
            style.getIconStyle().setScale(0.5);
            placemark.setStyleSelector(style);
            var point = ge.createPoint("");
            point.setLatitude(lat);
            point.setLongitude(lng);
            if (alt != 0)
            {
                point.setAltitudeMode(ge.ALTITUDE_ABSOLUTE);
                point.setAltitude(alt);
            }

            placemark.setGeometry(point);
            ge.getFeatures().appendChild(placemark);

            //set camera


        }
        private void setCameraView(double lat, double lng, double alt, dynamic ge)
        {
            var camera = ge.getView().copyAsCamera(ge.ALTITUDE_RELATIVE_TO_GROUND);

            camera.setLatitude(lat);
            camera.setLongitude(lng);
            camera.setAltitude(alt);
            ge.getView().setAbstractView(camera);
        }
        private void openawFileDialog_FileOk(object sender, CancelEventArgs e)
        {
            backgroundWorker1.RunWorkerAsync();

        }

        private void buttonReadHexFile_Click(object sender, EventArgs e)
        {
            openRawFileDialog.ShowDialog();
            labelWritingStatus.Text = "";
            labelAppendCSVStatus.Text = "";
        }


        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            bool showText = checkBoxShowText.Checked;
            progressBar1.Invoke((MethodInvoker)(() => progressBar1.Visible = true));
            // StringBuilder laz = new StringBuilder();
            // StringBuilder enc = new StringBuilder();
            csvOutput = new StringBuilder();
            csvOutput.Append(CSV_HEADER); //Add CSV Header

            st = new StringBuilder();//rich text box string

            Madgwick madgwick = new Madgwick(0.005f, 0.033f);
            float laserMeasurement = 0;
            long encoderRPos = 0;
            long encoderIPos = 0;
            long timeStamp = 0;
            double roll = 0;
            double pitch = 0;
            double yaw = 0;
            double accX = 0;
            double accY = 0;
            double accZ = 0;
            double gyroX = 0, gyroY = 0, gyroZ = 0;
            double magX = 0, magY = 0, magZ = 0;
            long tempTimeStamp;
            long dt = 0;
            long IMUtempT = 0;
            int roughnessFlag = 0;

            int dof9cycle = 0;
            int dof9counter = 0;
            int sectorCounts = 0;
            int measurementCounts = 0;

            //debug
            listTimeDiff = new PointPairList();
            listREncodertime = new PointPairList();
            listIEncodertime = new PointPairList();
            listEncDiff = new PointPairList();
            AccxTime = new PointPairList();
            AccyTime = new PointPairList();
            AcczTime = new PointPairList();
            GyroxTime = new PointPairList();
            GyroyTime = new PointPairList();
            GyrozTime = new PointPairList();
            MagxTime = new PointPairList();
            MagyTime = new PointPairList();
            MagzTime = new PointPairList();

            //output
            listLaseEnc = new PointPairList();
            AccxEncoder = new PointPairList();
            AccyEncoder = new PointPairList();
            AcczEncoder = new PointPairList();
            GyroxEncoder = new PointPairList();
            GyroyEncoder = new PointPairList();
            GyrozEncoder = new PointPairList();
            MagxEncoder = new PointPairList();
            MagyEncoder = new PointPairList();
            MagzEncoder = new PointPairList();

            PitchEncoder = new PointPairList();
            RollEncoder = new PointPairList();

            int i;

            rawBytes = File.ReadAllBytes(openRawFileDialog.FileName);
            tempTimeStamp = ((rawBytes[12]) << 16) | (rawBytes[13] << 8) | (rawBytes[14]);
            timeStamp = ((rawBytes[12]) << 16) | (rawBytes[13] << 8) | (rawBytes[14]);
            long tempencoderPos = encoderRPos = (rawBytes[4] << 24) | (rawBytes[5] << 16) | (rawBytes[6] << 8) | (rawBytes[7]);
            //MessageBox.Show(tempTimeStamp + "," + timeStamp);
            int size = rawBytes.Length;
            progressBar1.Invoke((MethodInvoker)(() => progressBar1.Maximum = size));

            for (i = 0; i < size - 512; )
            {
                if (rawBytes[i] == 0x00 && rawBytes[i + 1] == 0xFF)
                {
                    laserMeasurement = ((rawBytes[i + 2] << 8) | rawBytes[i + 3]) * 0.00012f + 7f;//shitty lazer
                }
                else
                {
                    laserMeasurement = (((rawBytes[i]) << 12) | ((rawBytes[i + 1]) << 8) | (((rawBytes[i + 2])) << 4) | (((rawBytes[i + 3])))) / 16463f * 19.5f + 5f;//USA lazer                   
                }

                encoderRPos = (rawBytes[i + 4] << 24) | (rawBytes[i + 5] << 16) | (rawBytes[i + 6] << 8) | (rawBytes[i + 7]);
                encoderIPos = (rawBytes[i + 8] << 24) | (rawBytes[i + 9] << 16) | (rawBytes[i + 10] << 8) | (rawBytes[i + 11]);
                encoderIPos = -encoderIPos;
                timeStamp = (rawBytes[i + 12] << 16) | (rawBytes[i + 13] << 8) | (rawBytes[i + 14]);
                dof9cycle++;
                i += 15;
                //append to CSVoutput laz enc enc time roughnessflag              

                if (roughnessFlag != 0)
                {
                    csvOutput.Append(laserMeasurement.ToString("0.0000") + "," + encoderRPos.ToString() + "," + encoderIPos.ToString() + "," + timeStamp.ToString() + "," + roughnessFlag.ToString());
                    roughnessFlag = 0;

                }
                else
                {
                    csvOutput.Append(laserMeasurement.ToString("0.0000") + "," + encoderRPos.ToString() + "," + encoderIPos.ToString() + "," + timeStamp.ToString() + ",");
                }

                //add to plot
                listREncodertime.Add(timeStamp, encoderRPos);
                listIEncodertime.Add(timeStamp, encoderIPos);
                listTimeDiff.Add(timeStamp, timeStamp - tempTimeStamp); tempTimeStamp = timeStamp;
                listLaseEnc.Add(encoderRPos, laserMeasurement);
                listEncDiff.Add(encoderRPos, encoderRPos - tempencoderPos);
                //append to textbox
                if (showText) { st.Append("Laser: " + laserMeasurement.ToString("0.0000") + "     enc: " + encoderRPos.ToString("00000000") + "   " + encoderIPos.ToString("00000000") + "     time: " + timeStamp.ToString("00000000")); }
                if (dof9cycle == 10)
                {
                    accX = translateAcc(i);//x
                    accY = translateAcc(i + 2);//y
                    accZ = translateAcc(i + 4);//z
                    gyroX = translateGyro(i + 6);
                    gyroY = translateGyro(i + 8);
                    gyroZ = translateGyro(i + 10);
                    magX = translateMag(i + 12);
                    magY = translateMag(i + 14);
                    magZ = translateMag(i + 16);

                    dt = timeStamp - IMUtempT;
                    //  Console.WriteLine(dt.ToString());
                    IMUtempT = timeStamp;
                    madgwick.SamplePeriod = dt / 1000.0f;//in seconds
                    // Console.WriteLine(dt + ";");
                    if (i < 600) { madgwick.Beta = 15f; }
                    else
                    {
                        madgwick.Beta = 0.033f;
                    }
                    double sigmaAcc = Math.Sqrt(accX * accX + accY * accY + accZ * accZ);
                    if (sigmaAcc > 1.05 || sigmaAcc < 0.85)
                    {
                        madgwick.Beta = 0.001f;
                    }

                    madgwick.Update((float)(gyroX * Math.PI / 180), (float)(gyroY * Math.PI / 180), (float)(gyroZ * Math.PI / 180), (float)accX, (float)accY, (float)accZ);//(float)magX, (float)magY, (float)magZ);
                    pitch = madgwick.MadgRoll;
                    roll = madgwick.MadgPitch;
                    yaw = madgwick.MadgYaw;
                    i += 18;
                    dof9cycle = 0;
                    dof9counter++;
                    csvOutput.Append("," + accX.ToString("0.0000") + "," + accY.ToString("0.0000") + "," + accZ.ToString("0.0000") + "," + gyroX.ToString("0.0000") + "," + gyroY.ToString("0.0000") + "," + gyroZ.ToString("0.0000") + "," + magX.ToString("0.0000") + "," + magY.ToString("0.0000") + "," + magZ.ToString("0.0000") + "," + pitch.ToString("0.0") + "," + roll.ToString("0.0") + "," + yaw.ToString("0.0") + "\r\n");


                    AccxTime.Add(timeStamp, accX);
                    AccyTime.Add(timeStamp, accY);
                    AcczTime.Add(timeStamp, accZ);
                    GyroxTime.Add(timeStamp, gyroX);
                    GyroyTime.Add(timeStamp, gyroY);
                    GyrozTime.Add(timeStamp, gyroZ);
                    MagxTime.Add(timeStamp, magX);
                    MagyTime.Add(timeStamp, magY);
                    MagzTime.Add(timeStamp, magZ);

                    AccxEncoder.Add(encoderRPos, accX);
                    AccyEncoder.Add(encoderRPos, accY);
                    AcczEncoder.Add(encoderRPos, accZ);
                    GyroxEncoder.Add(encoderRPos, gyroX);
                    GyroyEncoder.Add(encoderRPos, gyroY);
                    GyrozEncoder.Add(encoderRPos, gyroZ);
                    MagxEncoder.Add(encoderRPos, magX);
                    MagyEncoder.Add(encoderRPos, magY);
                    MagzEncoder.Add(encoderRPos, magZ);
                    PitchEncoder.Add(encoderRPos, pitch);
                    RollEncoder.Add(encoderRPos, roll);

                    if (showText) { st.Append("  Accx: " + accX.ToString("+0.000;-0.000;0") + "  Accy: " + accY.ToString("+0.000;-0.000;0") + "  Accz: " + accZ.ToString("+0.000;-0.000;0") + "  grx: " + gyroX.ToString("+0.000;-0.000;0") + "  gry: " + gyroY.ToString("+0.000;-0.000;0") + "  grz: " + gyroZ.ToString("+0.000;-0.000;0") + "\n"); }

                }
                else
                {
                    csvOutput.Append("\r\n");
                    if (showText) { st.Append("\n"); }
                }
                if (dof9counter == 3)
                {
                    roughnessFlag = rawBytes[i];
                    //  if (roughnessFlag != 0) { MessageBox.Show(roughnessFlag.ToString()); }
                    dof9counter = 0; i += 8;
                }





                // PitchEncoder.Add(encoderRPos, pitch);
                // RollEncoder.Add(encoderRPos, roll);




                tempencoderPos = encoderRPos;
                measurementCounts++;
                if (i > 0 && measurementCounts % 30 == 0) { sectorCounts++; }






                if (i % 2500 == 0) { backgroundWorker1.ReportProgress(i); }


            }

            labelBytesRead.Invoke((MethodInvoker)(() => labelBytesRead.Text = "file size: " + (rawBytes.Length).ToString() + " bytes\n" + " " + sectorCounts.ToString() + " sectors translated\naverage sample rate is\n" + measurementCounts / (timeStamp / 1000) + " samples/sec"));
            if (showText) { richTextBox1.Invoke((MethodInvoker)(() => richTextBox1.Text = st.ToString())); }
            richTextBox1.Invoke((MethodInvoker)(() => richTextBox1.SelectionStart = rawBytes.Length));

            progressBar1.Invoke((MethodInvoker)(() => progressBar1.Value = 0));


            TimeDiffPlane.CurveList.Clear();
            encoderTimePlane.CurveList.Clear();
            encoderDiffPlane.CurveList.Clear();
            AccTimePlane.CurveList.Clear();
            GyroTimePlane.CurveList.Clear();
            MagTimePlane.CurveList.Clear();

            AccEncoderPlane.CurveList.Clear();
            GyroEncoderPlane.CurveList.Clear();
            laserEncoderPlane.CurveList.Clear();
            PitchEncoderPlane.CurveList.Clear();
            RollEncoderPlane.CurveList.Clear();
            MagEncoderPlane.CurveList.Clear();




            TimeDiffPlane.AddCurve("Time Diff",
         listTimeDiff, Color.Blue, SymbolType.Diamond);
            encoderTimePlane.AddCurve("Right Enc",
          listREncodertime, Color.Green, SymbolType.Diamond);
            encoderTimePlane.AddCurve("Left Enc",
          listIEncodertime, Color.Blue, SymbolType.Diamond);
            encoderDiffPlane.AddCurve("Enc Diff",
          listEncDiff, Color.Black, SymbolType.Diamond);
            AccTimePlane.AddCurve("AccX",
     AccxTime, Color.Green, SymbolType.Diamond);
            AccTimePlane.AddCurve("AccY",
         AccyTime, Color.Yellow, SymbolType.Diamond);
            AccTimePlane.AddCurve("AccZ",
         AcczTime, Color.Blue, SymbolType.Diamond);
            GyroTimePlane.AddCurve("GyroX",
         GyroxTime, Color.Green, SymbolType.Diamond);
            GyroTimePlane.AddCurve("GyroY",
         GyroyTime, Color.Yellow, SymbolType.Diamond);
            GyroTimePlane.AddCurve("GyroZ",
         GyrozTime, Color.Blue, SymbolType.Diamond);
            MagTimePlane.AddCurve("MagX",
         MagxTime, Color.Green, SymbolType.Diamond);
            MagTimePlane.AddCurve("MagY",
         MagyTime, Color.Yellow, SymbolType.Diamond);
            MagTimePlane.AddCurve("MagZ",
         MagzTime, Color.Blue, SymbolType.Diamond);


            laserEncoderPlane.AddCurve("LAZ",
          listLaseEnc, Color.Red, SymbolType.Diamond);
            AccEncoderPlane.AddCurve("AccX",
         AccxEncoder, Color.Green, SymbolType.Diamond);
            AccEncoderPlane.AddCurve("AccY",
         AccyEncoder, Color.Yellow, SymbolType.Diamond);
            AccEncoderPlane.AddCurve("AccZ",
         AcczEncoder, Color.Blue, SymbolType.Diamond);
            GyroEncoderPlane.AddCurve("GyroX",
         GyroxEncoder, Color.Green, SymbolType.Diamond);
            GyroEncoderPlane.AddCurve("GyroY",
         GyroyEncoder, Color.Yellow, SymbolType.Diamond);
            GyroEncoderPlane.AddCurve("GyroZ",
         GyrozEncoder, Color.Blue, SymbolType.Diamond);
            MagEncoderPlane.AddCurve("MagX",
         MagxEncoder, Color.Green, SymbolType.Diamond);
            MagEncoderPlane.AddCurve("MagY",
         MagyEncoder, Color.Yellow, SymbolType.Diamond);
            MagEncoderPlane.AddCurve("MagZ",
         MagzEncoder, Color.Blue, SymbolType.Diamond);

            PitchEncoderPlane.AddCurve("Porsche",
         PitchEncoder, Color.Green, SymbolType.Diamond);
            RollEncoderPlane.AddCurve("Porsche",
         RollEncoder, Color.Green, SymbolType.Diamond);

            progressBar1.Invoke((MethodInvoker)(() => progressBar1.Visible = false));
            progressBar1.Invoke((MethodInvoker)(() => plotStuff()));

        }

        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            progressBar1.Value = e.ProgressPercentage;
        }

        private void buttonPlot_Click(object sender, EventArgs e)
        {
            plotStuff();
        }
        private void plotStuff()
        {

            zedLaserTime.AxisChange(); zedLaserTime.Refresh();
            zedEncoderTime.AxisChange(); zedEncoderTime.Refresh();
            zedEncoderDiff.AxisChange(); zedEncoderDiff.Refresh();
            zedAccTime.AxisChange(); zedAccTime.Refresh();
            zedGyroTime.AxisChange(); zedGyroTime.Refresh();
            zedMagTime.AxisChange(); zedMagTime.Refresh();

            zedGyro.AxisChange(); zedGyro.Refresh();
            zedAcc.AxisChange(); zedAcc.Refresh();
            zedLazerEncoder.AxisChange(); zedLazerEncoder.Refresh();
            zedPitch.AxisChange(); zedPitch.Refresh();
            zedRoll.AxisChange(); zedRoll.Refresh();
            zedMag.AxisChange(); zedMag.Refresh();
        }

        private double translatePitch(int i)
        {
            return 0;
        }
        private double translateRoll(int i)
        {
            return 0;
        }
        private double translateAcc(int i)
        {
            int accTemp = 0;
            accTemp = ((Int16)rawBytes[i] << 8) + (Int16)rawBytes[i + 1];
            //Console.WriteLine(rawBytes[i]+" "+rawBytes[i+1]);
            return (Int16)accTemp * 0.0078f;

        }
        private double translateGyro(int i)
        {
            int gyroTemp = 0;
            gyroTemp = ((int)(rawBytes[i] << 8 | rawBytes[i + 1] & 0xFFFF));
            return (Int16)gyroTemp / 14.375f;
        }
        private double translateMag(int i)
        {
            int magTemp = 0;
            magTemp = ((int)(rawBytes[i] << 8 | rawBytes[i + 1] & 0xFFFF));
            return (Int16)magTemp;
        }


        private void buttonWriteRawCSV_Click(object sender, EventArgs e)
        {
            DialogResult result = this.folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                String folder = folderBrowserDialog1.SelectedPath;
                FileStream fs1 = new FileStream(folder + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv", FileMode.OpenOrCreate, FileAccess.Write);
                StreamWriter writer = new StreamWriter(fs1);
                try
                {
                    writer.Write(csvOutput.ToString());
                    writer.Close();
                    fs1.Close();
                    // MessageBox.Show
                    labelWritingStatus.ForeColor = Color.Green;
                    labelWritingStatus.Text = ("Successfully wrote to " + folder + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv");
                }
                catch (Exception ex)
                {
                    //MessageBox.Show
                    labelWritingStatus.ForeColor = Color.Red;
                    labelWritingStatus.Text = ("Failed to write to " + folder + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv");
                    Console.WriteLine(ex.Message);
                }
                //save as lazer vs encoder as an image
                progressBar1.Invoke((MethodInvoker)(() => zedLazerEncoder.MasterPane.GetImage().Save(folder + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".bmp")));
            }
        }

        private void buttonReadGPS_Click(object sender, EventArgs e)
        {
            openGPSFileDialog.ShowDialog();
        }

        private void openGPSFileDialog_FileOk(object sender, CancelEventArgs e)
        {
            String GPSFileName = openGPSFileDialog.FileName;
            String GPSLine;

            System.IO.StreamReader file = new System.IO.StreamReader(GPSFileName);
            StringBuilder parsedGPSString = new StringBuilder();
            String Parsed = null;//each parsed line
            parsedGPSLine = new List<string>();
            String[] fields = null;
            double currentLat, currentLng, currentAlt;


            SharpKml.Dom.Placemark placemark;
            // KmlFile kml = KmlFile.Create(placemark, false);
            Document document = new Document();
            while ((GPSLine = file.ReadLine()) != null)
            {
                //MessageBox.Show(GPSLine);
                Parsed = parseRawGPSLine(GPSLine);//parsing GPSLine from GPS file
                parsedGPSString.Append(Parsed);//for textbox
                parsedGPSLine.Add(Parsed);//for later use

                fields = Parsed.Split(new Char[] { ',' });


                currentLat = Convert.ToDouble(fields[1]);
                currentLng = Convert.ToDouble(fields[2]);
                currentAlt = Convert.ToDouble(fields[3]);
            /*  addNewPlaceMark(currentLat, currentLng, currentAlt, geSingle);//plot on GE
                setCameraView(currentLat, currentLng, 100, geSingle);

                SharpKml.Dom.Point point = new SharpKml.Dom.Point();//create KML
                point.Coordinate = new Vector(currentLat, currentLng);
                placemark = new SharpKml.Dom.Placemark();
                placemark.Geometry = point;
                // placemark.Name = "Machu Picchu";
                document.AddFeature(placemark);
             * */
            }

            richTextBoxGPS.Text = parsedGPSString.ToString();
            file.Close();
            //writing to kml
          /*  Kml root = new Kml();
            root.Feature = document;
            KmlFile kml = KmlFile.Create(root, false);
            try
            {
                using (FileStream stream = File.OpenWrite(GPSFileName.Substring(0, GPSFileName.LastIndexOf('.'))))
                {
                    kml.Save(stream);
                    MessageBox.Show(GPSFileName.Substring(0, GPSFileName.LastIndexOf('.')) + " has been created");
                }
            }
            catch (Exception ex) { }
            */
        }
        private String parseRawGPSLine(String GPSLine)
        {
            String[] fields;
            float Lat, Lng, Alt;
            int numberOfSat, fixStatus;
            fields = GPSLine.Split(',');
            StringBuilder parsedGPSLineString = new StringBuilder();

            parsedGPSLineString.Append("UTC");
            parsedGPSLineString.Append(GPSLine.Substring(0, 2)).Append(':');//hour
            parsedGPSLineString.Append(GPSLine.Substring(2, 2)).Append(':');//minutes
            parsedGPSLineString.Append(GPSLine.Substring(4, 2)).Append('.');//seconds
            parsedGPSLineString.Append(GPSLine.Substring(7, 3)).Append(',');//miliseconds
            Lat = Convert.ToSingle(GPSLine.Substring(11, 2)) + (Convert.ToSingle(GPSLine.Substring(13, 7))) / 60;
            if (GPSLine.Substring(21, 1).Equals("S"))
            {
                Lat = -Lat;
            }
            Lng = Convert.ToSingle(GPSLine.Substring(23, 3)) + (Convert.ToSingle(GPSLine.Substring(26, 7))) / 60;
            Alt = Convert.ToSingle(fields[8]);
            if (GPSLine.Substring(34, 1).Equals("W"))
            {
                Lng = -Lng;
            }
            parsedGPSLineString.Append(Lat.ToString("0.000000")).Append(",").Append(Lng.ToString("0.000000")).Append(",").Append(Alt.ToString("0.000000")).Append(",");

            numberOfSat = Convert.ToInt16(GPSLine.Substring(38, 2));
            fixStatus = Convert.ToInt16(GPSLine.Substring(36, 1));
            parsedGPSLineString.Append(numberOfSat).Append(",").Append(fixStatus);
            if (GPSLine.Length > 50)
            {
                parsedGPSLineString.Append(",DSLR");
            }
            parsedGPSLineString.Append(Environment.NewLine);
            return parsedGPSLineString.ToString();

        }
        private void buttonAppendToCSV_Click(object sender, EventArgs e)//reads a line from raw fi csv and append GPS at the end. It creates a new file
        {
            System.IO.StreamReader file = new System.IO.StreamReader(folderBrowserDialog1.SelectedPath + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv");
            //  MessageBox.Show();
            String Line;
            StringBuilder stb = new StringBuilder();
            int i = 0;
            PathMetTime StartTime = null;
            PathMetTime newTime;
            String GPStimestamp;
            long currentMills = 0;
            int currentGPSHour, currentGPSMinute, currentGPSSec, currentGPSMilliSec;
            int numberfOfGPSPoints = parsedGPSLine.Count;
            while ((Line = file.ReadLine()) != null)
            {
                if (i == 0)
                {
                    stb.Append(Line + Environment.NewLine);
                    i++;
                }
                else if (i <= numberfOfGPSPoints - 1)
                {
                    String[] fields = Line.Split(new Char[] { ',' });
                    int fieldSize = fields.Length;
                    GPStimestamp = parsedGPSLine[i].Substring(3, 12);
                    currentGPSHour = Convert.ToInt32(GPStimestamp.Substring(0, 2));
                    currentGPSMinute = Convert.ToInt32(GPStimestamp.Substring(3, 2));
                    currentGPSSec = Convert.ToInt32(GPStimestamp.Substring(6, 2));
                    currentGPSMilliSec = Convert.ToInt32(GPStimestamp.Substring(9, 3));


                    if (i != 1)
                    {
                        newTime = new PathMetTime(currentGPSHour, currentGPSMinute, currentGPSSec, currentGPSMilliSec);
                        currentMills = newTime.subtract(StartTime) + StartTime.offset;
                        if (currentMills <= Convert.ToInt64(fields[3]))
                        {
                            stb.Append(Line.TrimEnd('\r', '\n'));
                            //append GPS to a the original line
                            if (fieldSize < 10) { stb.Append(",,,,,,,,,,,,"); }//if the line doesn't have IMU
                            stb.Append(',').Append(parsedGPSLine[i].Substring(0, 16) + Convert.ToString(currentMills) + ',' + parsedGPSLine[i].Substring(16));
                            i++;
                            currentMills = Convert.ToInt64(fields[3]);
                        }
                        else
                        {

                            stb.Append(Line + Environment.NewLine);
                        }

                    }
                    else//i==1
                    {
                        // If first line of data, create a new PathMetTime
                        stb.Append(Line.TrimEnd('\r', '\n'));
                        if (fieldSize < 10) { stb.Append(",,,,,,,,,,,,"); }//if the line doesn't have IMU. it for sure doesn't have more than 10 fields                   
                        stb.Append(',').Append(parsedGPSLine[i].Substring(0, 16) + fields[3] + "," + parsedGPSLine[i].Substring(16)); // Start timestamp at 1mS
                        //  MessageBox.Show(stb.ToString());
                        StartTime = new PathMetTime(currentGPSHour, currentGPSMinute, currentGPSSec, currentGPSMilliSec);
                        StartTime.set_offset(Convert.ToInt32(fields[3]));
                        i++;
                    }
                }
                else
                {
                    stb.Append(Line).Append(Environment.NewLine);
                }

            }
            file.Close();
            try
            {
                StreamWriter writer = new StreamWriter(folderBrowserDialog1.SelectedPath + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv", false);
                writer.Write(stb);
                writer.Close();
                labelAppendCSVStatus.Text = "Successfully wrote to " + folderBrowserDialog1.SelectedPath + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv";
                labelAppendCSVStatus.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                labelAppendCSVStatus.Text = "Fail to write to " + folderBrowserDialog1.SelectedPath + openRawFileDialog.FileName.Substring(openRawFileDialog.FileName.LastIndexOf('\\')) + ".csv";
                labelAppendCSVStatus.ForeColor = Color.Red;
            }


        }




        private void buttonSetCSVPath_Click(object sender, EventArgs e)
        {
            DialogResult result = this.folderBrowserDialogFileFolderPath.ShowDialog();
            if (result == DialogResult.OK)
            {
                csvOutputPath = folderBrowserDialogFileFolderPath.SelectedPath;

                labelCSVOuputPath.Text = csvOutputPath;
            }
        }
        private void buttonSetGPSInputPath_Click(object sender, EventArgs e)
        {
            DialogResult result = this.folderBrowserDialogFileFolderPath.ShowDialog();
            if (result == DialogResult.OK)
            {
                ListViewItem tempItem = null;
                GPSInputPath = folderBrowserDialogFileFolderPath.SelectedPath;
                labelGPSInputPath.Text = GPSInputPath;
                DirectoryInfo dInfo = new DirectoryInfo(GPSInputPath);
                DirectoryInfo[] subdirs = dInfo.GetDirectories();
                if (subdirs.Length != listView.Items.Count)
                {
                    MessageBox.Show("The number of GPS in the given folder is not the same as raw files");
                    GPSInputPath = null;
                    labelGPSInputPath.Text = "Fatal Error";
                    labelGPSInputPath.ForeColor = Color.Red;
                    return;
                }
                try
                {
                    int i = 0;
                    String rawFileName, GPSFileName;
                    foreach (ListViewItem item in listView.Items)
                    {
                        rawFileName = item.Text.Substring(item.Text.LastIndexOf('\\') + 1);
                        GPSFileName = subdirs[i].Name;
                        tempItem = new ListViewItem(item.Text);

                        //need to remove the original item and add it back               
                        if (!rawFileName.Equals(GPSFileName))
                        {

                            MessageBox.Show("The names of some files don't match up. Please double check them");
                            labelGPSInputPath.Text = "Fatal Error";
                            labelGPSInputPath.ForeColor = Color.Red;
                            return;
                        }
                        tempItem.SubItems.Add(subdirs[i++].FullName);
                        listView.Items.Remove(item);
                        listView.Items.Add(tempItem);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.ToString());
                    GPSInputPath = null;
                    labelGPSInputPath.Text = "Not Set";
                }
            }

        }
        private void buttonSetRawInputPath_Click(object sender, EventArgs e)
        {
            DialogResult result = this.folderBrowserDialogFileFolderPath.ShowDialog();
            if (result == DialogResult.OK)
            {
                RawFileInputPath = folderBrowserDialogFileFolderPath.SelectedPath;

                labelRawInputPath.Text = RawFileInputPath;

                String[] rawFileList = Directory.GetFiles(RawFileInputPath);
                if (rawFileList.Length == 0) { MessageBox.Show("There is no file to process in the directory: " + RawFileInputPath); return; }
                listView.Clear();
                listView.Invoke((MethodInvoker)(() => listView.Columns.Add("Raw Files")));
                listView.Invoke((MethodInvoker)(() => listView.Columns.Add("GPS files")));
                foreach (String n in rawFileList)
                {
                    string[] row = { n, "" };
                    var listViewItem = new ListViewItem(row);

                    listView.Invoke((MethodInvoker)(() => listView.Items.Add(listViewItem)));
                }
                listView.Invoke((MethodInvoker)(() => listView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)));
                listView.Invoke((MethodInvoker)(() => listView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)));
                progressBarCurrentFileProgress.Value = 0;
                progressBarTotalProgress.Value = 0;
            }
        }
        private void buttonSetDSLRPath_Click(object sender, EventArgs e)
        {
            DialogResult result = this.folderBrowserDialogFileFolderPath.ShowDialog();
            if (result == DialogResult.OK)
            {
                DSLRPath = folderBrowserDialogFileFolderPath.SelectedPath;
                labelDSLRPath.Text = DSLRPath;
            }

            /* 
                Bitmap bmp =
                  new Bitmap("D:\\a.JPG");
                Goheer.EXIF.EXIFextractor er =
                 new Goheer.EXIF.EXIFextractor(ref bmp, "\n");

                Encoding ascii = Encoding.ASCII;
                er.setTag(0x9286, "44.12345");
                Console.WriteLine(er["User Comment"]);
                Console.WriteLine(er["Date Time"]);
     */


            // Bitmap backup = bmp.Clone(new Rectangle(0, 0, bmp.Width, bmp.Height), bmp.PixelFormat);
            // bmp.Dispose();
            //backup.Dispose();
            //  File.Delete("D:\\a.JPG");
            //   bmp.Save("D:\\b.JPG");
            // bmp.Dispose();


        }


        private void backgroundWorker2_DoWork(object sender, DoWorkEventArgs e)
        {
            if (RawFileInputPath == null)
            {
                MessageBox.Show("You must set raw file input folder first.");
                return;
            }
            if (csvOutputPath == null)
            {
                MessageBox.Show("You must set CSV file output folder first.");
                return;
            }
            if (GPSInputPath == null)
            {
                MessageBox.Show("You must set GPS file input folder first.");
                return;
            }





            //#############################################################################
            //############################################################################# translating raw data files and GPS
            String[] rawFileList = Directory.GetFiles(RawFileInputPath);

            int numberOfFilesInFolder = rawFileList.Length;
            int fileIndex = 0;//keeps index for all raw files and GPS files
            List<String> TriggerGPS = new List<string>();//a list contains when and where a picture is taken, contains all Triggers in the GPS folder

            backgroundWorker2.ReportProgress(0);



            foreach (String rawFileName in rawFileList)//iterates all raw files and GPS files. The number should match.
            {
                String GPSFileName = null;
                listView.Invoke((MethodInvoker)(() => GPSFileName = listView.Items[fileIndex].SubItems[1].Text + "\\GPS1.TXT"));//get GPS file path
                System.IO.StreamReader GPSfile = new System.IO.StreamReader(GPSFileName);


                //   GMapOverlay markersOverlay = new GMapOverlay(gMapControl1, GPSFileName);


                String GPSParsedLine = null;
                String GPSLine = null;
                Boolean GPSnextLine = true;
                PathMetTime StartTime = null;
                long currentMills = 0;
                Boolean GPSEOF = false;
                double oldLat = 0;
                double oldLng = 0;
                double currentLat, currentLng, currentAlt;

                csvOutput = new StringBuilder();
                csvOutput.Append(CSV_HEADER); //Add CSV Header

                st = new StringBuilder();//rich text box string
                float laserMeasurement = 0;
                long encoderRPos = 0;
                long encoderIPos = 0;
                long timeStamp = 0;
                double roll = 0;
                double pitch = 0;
                double yaw = 0;
                double accX = 0;
                double accY = 0;
                double accZ = 0;
                double gyroX = 0, gyroY = 0, gyroZ = 0;
                double magX = 0, magY = 0, magZ = 0;
                double tempTimeStamp;
                int roughnessFlag = 0;
                long dt = 0;
                long IMUtempT = 0;
                Madgwick madgwick = new Madgwick(0.005f, 0.033f);


                int dof9cycle = 0;
                int dof9counter = 0;
                int sectorCounts = 0;
                int measurementCounts = 0;

                listLaseEnc = new PointPairList();
                listTimeDiff = new PointPairList();

                int i;

                rawBytes = File.ReadAllBytes(rawFileName);
                tempTimeStamp = ((rawBytes[12]) << 16) | (rawBytes[13] << 8) | (rawBytes[14]);
                timeStamp = ((rawBytes[12]) << 16) | (rawBytes[13] << 8) | (rawBytes[14]);
                long tempencoderPos = encoderRPos = (rawBytes[4] << 24) | (rawBytes[5] << 16) | (rawBytes[6] << 8) | (rawBytes[7]);
                //MessageBox.Show(tempTimeStamp + "," + timeStamp);
                int size = rawBytes.Length;

                SharpKml.Dom.Placemark placemark;
                Document document = new Document();

                for (i = 0; i < size - 512; )//reading raw files
                {
                    //laserMeasurement = (((rawBytes[i]) << 12) | ((rawBytes[i + 1]) << 8) | (((rawBytes[i + 2])) << 4) | (((rawBytes[i + 3])))) / 16463f * 19.5f + 5f;
                    if (rawBytes[i] == 0x00 && rawBytes[i + 1] == 0xFF)
                    {
                        laserMeasurement = ((rawBytes[i + 2] << 8) | rawBytes[i + 3]) * 0.00012f + 7f;//shitty lazer
                    }
                    else
                    {
                        laserMeasurement = (((rawBytes[i]) << 12) | ((rawBytes[i + 1]) << 8) | (((rawBytes[i + 2])) << 4) | (((rawBytes[i + 3])))) / 16463f * 19.5f + 5f;//USA lazer                   
                    }
                    encoderRPos = (rawBytes[i + 4] << 24) | (rawBytes[i + 5] << 16) | (rawBytes[i + 6] << 8) | (rawBytes[i + 7]);
                    encoderIPos = (rawBytes[i + 8] << 24) | (rawBytes[i + 9] << 16) | (rawBytes[i + 10] << 8) | (rawBytes[i + 11]);
                    encoderIPos = -encoderIPos;
                    timeStamp = (rawBytes[i + 12] << 16) | (rawBytes[i + 13] << 8) | (rawBytes[i + 14]);

                    PathMetTime newTime;
                    String GPStimestamp;

                    int currentGPSHour, currentGPSMinute, currentGPSSec, currentGPSMilliSec;
                    String[] fields = null;
                    int fieldSize = 0;

                    if (GPSnextLine && (!GPSEOF))//read GPS file
                    {//move on to next line

                        if ((GPSLine = GPSfile.ReadLine()) != null)
                        {

                            GPSParsedLine = parseRawGPSLine(GPSLine);//parse one line
                            GPSnextLine = false;
                            fields = GPSParsedLine.Split(new Char[] { ',' });
                            fieldSize = fields.Length;

                            currentLat = Convert.ToDouble(fields[1]);
                            currentLng = Convert.ToDouble(fields[2]);
                            currentAlt = Convert.ToDouble(fields[3]);
                            GPStimestamp = GPSParsedLine.Substring(3, 12);
                            currentGPSHour = Convert.ToInt32(GPStimestamp.Substring(0, 2));
                            currentGPSMinute = Convert.ToInt32(GPStimestamp.Substring(3, 2));
                            currentGPSSec = Convert.ToInt32(GPStimestamp.Substring(6, 2));
                            currentGPSMilliSec = Convert.ToInt32(GPStimestamp.Substring(9, 3));

                            if (fieldSize == 7)//only happens when a picture is taken
                            {
                                TriggerGPS.Add(GPSParsedLine);
                                if (checkBoxGPSmapUpdate.Checked)
                                {
                                    addNewPlaceMark(currentLat, currentLng, 0, ge);//altitude turned off
                                    setCameraView(currentLat, currentLng, 100, ge);
                                }

                                SharpKml.Dom.Point point = new SharpKml.Dom.Point();
                                point.Coordinate = new Vector(currentLat, currentLng);
                                placemark = new SharpKml.Dom.Placemark();
                                placemark.Geometry = point;
                                document.AddFeature(placemark);
                                //if (i == 0) { Thread.Sleep(500); };

                            }
                            if (i == 0)
                            {//first GPS line as reference
                                StartTime = new PathMetTime(currentGPSHour, currentGPSMinute, currentGPSSec, currentGPSMilliSec);
                                StartTime.set_offset(Convert.ToInt32(timeStamp));
                            }

                            newTime = new PathMetTime(currentGPSHour, currentGPSMinute, currentGPSSec, currentGPSMilliSec);
                            currentMills = newTime.subtract(StartTime) + StartTime.offset;//calculate GPS milisec with repect to the starting point 

                            if (oldLat != currentLat || oldLng != currentLng)
                            {
                                if (checkBoxGPSmapUpdate.Checked)
                                {
                                    addNewPlaceMark(currentLat, currentLng, 0, ge);//plot all GPS on GE
                                    setCameraView(currentLat, currentLng, 100, ge);
                                    oldLng = currentLng;
                                    oldLat = currentLat;
                                    if (i == 0) { Thread.Sleep(500); };
                                }

                            }



                        }
                        else { GPSEOF = true; }
                    }


                    dof9cycle++;
                    i += 15;
                    //add to plot
                    listTimeDiff.Add(timeStamp, timeStamp - tempTimeStamp); tempTimeStamp = timeStamp;
                    listLaseEnc.Add(encoderRPos, laserMeasurement);
                    //append to csvoutput

                    if (roughnessFlag != 0)//rest roughness flag since it only happen once per sector
                    {
                        csvOutput.Append(laserMeasurement.ToString("0.0000") + "," + encoderRPos.ToString() + "," + encoderIPos.ToString() + "," + timeStamp.ToString() + "," + roughnessFlag.ToString());
                        roughnessFlag = 0;
                    }
                    else
                    {
                        csvOutput.Append(laserMeasurement.ToString("0.0000") + "," + encoderRPos.ToString() + "," + encoderIPos.ToString() + "," + timeStamp.ToString() + ",");
                    }
                    if (dof9cycle == 10)
                    {
                        accX = translateAcc(i);//x
                        accY = translateAcc(i + 2);//y
                        accZ = translateAcc(i + 4);//z
                        gyroX = translateGyro(i + 6);
                        gyroY = translateGyro(i + 8);
                        gyroZ = translateGyro(i + 10);
                        magX = translateMag(i + 12);
                        magY = translateMag(i + 14);
                        magZ = translateMag(i + 16);
                        //##################################madgwick shit
                        dt = timeStamp - IMUtempT;
                        IMUtempT = timeStamp;
                        madgwick.SamplePeriod = dt / 1000.0f;//in seconds
                        // Console.WriteLine(dt + ";");
                        if (i < 600) { madgwick.Beta = 15f; }
                        else
                        {
                            madgwick.Beta = 0.033f;
                        }
                        double sigmaAcc = Math.Sqrt(accX * accX + accY * accY + accZ * accZ);
                        if (sigmaAcc > 1.05 || sigmaAcc < 0.85)
                        {
                            madgwick.Beta = 0.001f;
                        }

                        madgwick.Update((float)(gyroX * Math.PI / 180), (float)(gyroY * Math.PI / 180), (float)(gyroZ * Math.PI / 180), (float)accX, (float)accY, (float)accZ);//, (float)magX, (float)magY, (float)magZ);
                        roll = madgwick.MadgRoll;
                        pitch = madgwick.MadgPitch;
                        yaw = madgwick.MadgYaw;
                        //########################
                        i += 18;
                        dof9cycle = 0;
                        dof9counter++;

                        csvOutput.Append("," + accX.ToString("0.0000") + "," + accY.ToString("0.0000") + "," + accZ.ToString("0.0000") + "," + gyroX.ToString("0.0000") + "," + gyroY.ToString("0.0000") + "," + gyroZ.ToString("0.0000") + "," + magX.ToString("0.0000") + "," + magY.ToString("0.0000") + "," + magZ.ToString("0.0000") + "," + pitch.ToString("0.0") + "," + roll.ToString("0.0") + "," + yaw.ToString("0.0"));
                        if (currentMills <= timeStamp && (!GPSEOF))//time stamp match, append GPS line
                        {
                            csvOutput.Append(",").Append(GPSParsedLine.Substring(0, 16) + Convert.ToString(currentMills) + ',' + GPSParsedLine.Substring(16));

                            GPSnextLine = true;//move on to a new line
                        }
                        else
                        {
                            csvOutput.Append(Environment.NewLine);
                        }
                    }
                    else
                    {
                        if (currentMills <= timeStamp && (!GPSEOF))//time stamp match, append GPS line
                        {
                            csvOutput.Append(",,,,,,,,,,,,,").Append(GPSParsedLine.Substring(0, 16) + Convert.ToString(currentMills) + ',' + GPSParsedLine.Substring(16));
                            GPSnextLine = true;//move on to a new line
                        }
                        else
                        {
                            csvOutput.Append(Environment.NewLine);
                        }
                    }
                    if (dof9counter == 3)
                    {
                        dof9counter = 0; roughnessFlag = rawBytes[i]; i += 8;
                    }

                    tempencoderPos = encoderRPos;
                    measurementCounts++;
                    if (i > 0 && measurementCounts % 30 == 0) { sectorCounts++; }
                    if (i % (i / (size - 512.0) * 10) == 0) { backgroundWorker2.ReportProgress((int)(i / (size - 512.0) * 100), "current"); }
                    if (i == size - 512)
                    {
                        fileIndex++;//saves the index of which file is being processed
                        backgroundWorker2.ReportProgress((int)(fileIndex * 1.0 / numberOfFilesInFolder * 100), "total");
                    }


                }
                //################################################################
                //################################################################  Writing to CSV files
                String newCSVfilename = csvOutputPath + "\\" + rawFileName.Substring(rawFileName.LastIndexOf('\\')) + ".csv";
                FileStream fs1 = new FileStream(newCSVfilename, FileMode.OpenOrCreate, FileAccess.Write);

                StreamWriter writer = new StreamWriter(fs1);
                try
                {
                    writer.Write(csvOutput.ToString());
                    writer.Close();
                    fs1.Close();
                    ListViewItem currentItem = null;
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => currentItem = listView.FindItemWithText(rawFileName)));
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => currentItem.BackColor = Color.Green));
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => currentItem.ForeColor = Color.White));
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => listView.EnsureVisible(currentItem.Index)));
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => labelTranslatingProgress.Text = "Translating file: " + rawFileName.Substring(rawFileName.LastIndexOf('\\') + 1)));
                }
                catch (Exception ex)
                {
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => labelTranslatingProgress.ForeColor = Color.Red));
                    labelTranslatingProgress.Invoke((MethodInvoker)(() => MessageBox.Show("Failed to write to " + newCSVfilename)));
                    MessageBox.Show(ex.ToString());
                    return;
                }
                //################################################################
                //################################################################ writing to kml        
                Kml root = new Kml();
                root.Feature = document;
                KmlFile kml = KmlFile.Create(root, false);
                try
                {
                    using (FileStream stream = File.OpenWrite(csvOutputPath + "\\" + rawFileName.Substring(rawFileName.LastIndexOf('\\')) + ".kml"))
                    {
                        kml.Save(stream);
                        //MessageBox.Show(GPSFileName.Substring(0, GPSFileName.LastIndexOf('.')) + " has been created");
                    }
                }
                catch (Exception ex) { }




            }
            labelTranslatingProgress.Invoke((MethodInvoker)(() => labelTranslatingProgress.ForeColor = Color.Green));
            labelTranslatingProgress.Invoke((MethodInvoker)(() => labelTranslatingProgress.Text = ("Successfully processed folder " + RawFileInputPath)));



            /*
                        //################################################################  Modifying DSLR pictures
                        int numberOfTriggers = TriggerGPS.Count;//number of triggers in GPS should be the same as number of pictures.
                        String[] picFileList = Directory.GetFiles(DSLRPath);//get names of all pictures

                        if (picFileList.Length != numberOfTriggers)
                        {
                            MessageBox.Show("wanring, pictures from DSLR in " + DSLRPath + "don't match with GPS files");
                        }

                        /*     for (int temp = 0; temp < numberOfTriggers; temp++)
                             {
                                 EXIFEdit pic = new EXIFEdit(picFileList[temp]);
                               //  MessageBox.Show(pic.CreateTime);

                             }
                 */
            //  MessageBox.Show("..");
            //save as lazer vs encoder as an image


            //################################################################# adding to map
            // MessageBox.Show("adding " + markersOverlay.Markers.Count);
            // gMapControl1.Overlays.Add(markersOverlay);


            backgroundWorker2.ReportProgress(0, "current");
            backgroundWorker2.ReportProgress(0, "total");
        }

        private void backgroundWorker2_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            if (Equals(e.UserState, "current"))
            { progressBarCurrentFileProgress.Value = e.ProgressPercentage; }
            else if (Equals(e.UserState, "total"))
            {
                progressBarTotalProgress.Value = e.ProgressPercentage;
            }


        }

        private void buttonStartTranslation_Click(object sender, EventArgs e)
        {
            backgroundWorker2.RunWorkerAsync();
        }

        private void buttonClearMap_Click(object sender, EventArgs e)
        {
            // gMapControl1.Overlays.Clear();
            var features = ge.getFeatures();
            while (features.getFirstChild() != null)
            {
                features.removeChild(features.getFirstChild());
            }

        }

        private void buttonKMLTabGPSPath_Click(object sender, EventArgs e)
        {

        }










    }
}
