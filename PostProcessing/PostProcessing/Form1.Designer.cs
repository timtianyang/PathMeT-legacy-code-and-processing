namespace PostProcessing
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.buttonReadHexFile = new System.Windows.Forms.Button();
            this.openRawFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.labelBytesRead = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.zedLazerEncoder = new ZedGraph.ZedGraphControl();
            this.buttonPlot = new System.Windows.Forms.Button();
            this.zedLaserTime = new ZedGraph.ZedGraphControl();
            this.zedEncoderTime = new ZedGraph.ZedGraphControl();
            this.zedEncoderDiff = new ZedGraph.ZedGraphControl();
            this.zedTabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tabPage8 = new System.Windows.Forms.TabPage();
            this.zedAccTime = new ZedGraph.ZedGraphControl();
            this.tabPage9 = new System.Windows.Forms.TabPage();
            this.zedGyroTime = new ZedGraph.ZedGraphControl();
            this.tabPage13 = new System.Windows.Forms.TabPage();
            this.zedMagTime = new ZedGraph.ZedGraphControl();
            this.tabControl2 = new System.Windows.Forms.TabControl();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.zedAcc = new ZedGraph.ZedGraphControl();
            this.tabPage7 = new System.Windows.Forms.TabPage();
            this.zedGyro = new ZedGraph.ZedGraphControl();
            this.tabPage14 = new System.Windows.Forms.TabPage();
            this.zedMag = new ZedGraph.ZedGraphControl();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.zedRoll = new ZedGraph.ZedGraphControl();
            this.zedPitch = new ZedGraph.ZedGraphControl();
            this.tabControl3 = new System.Windows.Forms.TabControl();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.tabPage6 = new System.Windows.Forms.TabPage();
            this.buttonWrite = new System.Windows.Forms.Button();
            this.tabControl4 = new System.Windows.Forms.TabControl();
            this.tabPage10 = new System.Windows.Forms.TabPage();
            this.labelWritingStatus = new System.Windows.Forms.Label();
            this.checkBoxShowText = new System.Windows.Forms.CheckBox();
            this.tabPage11 = new System.Windows.Forms.TabPage();
            this.geWebBrowserSingle = new FC.GEPluginCtrls.GEWebBrowser();
            this.labelAppendCSVStatus = new System.Windows.Forms.Label();
            this.buttonAppendToCSV = new System.Windows.Forms.Button();
            this.richTextBoxGPS = new System.Windows.Forms.RichTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.buttonReadGPS = new System.Windows.Forms.Button();
            this.tabPage12 = new System.Windows.Forms.TabPage();
            this.checkBoxGPSmapUpdate = new System.Windows.Forms.CheckBox();
            this.geWebBrowser1 = new FC.GEPluginCtrls.GEWebBrowser();
            this.buttonClearMap = new System.Windows.Forms.Button();
            this.listView = new System.Windows.Forms.ListView();
            this.progressBarTotalProgress = new System.Windows.Forms.ProgressBar();
            this.progressBarCurrentFileProgress = new System.Windows.Forms.ProgressBar();
            this.labelTranslatingProgress = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.buttonStartTranslation = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.labelDSLRPath = new System.Windows.Forms.Label();
            this.buttonSetDSLRPath = new System.Windows.Forms.Button();
            this.labelGPSInputPath = new System.Windows.Forms.Label();
            this.labelRawInputPath = new System.Windows.Forms.Label();
            this.labelCSVOuputPath = new System.Windows.Forms.Label();
            this.buttonSetCSVPath = new System.Windows.Forms.Button();
            this.buttonSetGPSInputPath = new System.Windows.Forms.Button();
            this.buttonSetRawInputPath = new System.Windows.Forms.Button();
            this.tabPage15 = new System.Windows.Forms.TabPage();
            this.label3 = new System.Windows.Forms.Label();
            this.buttonKMLTabGPSPath = new System.Windows.Forms.Button();
            this.openGPSFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.backgroundWorker2 = new System.ComponentModel.BackgroundWorker();
            this.folderBrowserDialogFileFolderPath = new System.Windows.Forms.FolderBrowserDialog();
            this.backgroundWorker3 = new System.ComponentModel.BackgroundWorker();
            this.zedTabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage8.SuspendLayout();
            this.tabPage9.SuspendLayout();
            this.tabPage13.SuspendLayout();
            this.tabControl2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.tabPage7.SuspendLayout();
            this.tabPage14.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.tabControl3.SuspendLayout();
            this.tabPage5.SuspendLayout();
            this.tabPage6.SuspendLayout();
            this.tabControl4.SuspendLayout();
            this.tabPage10.SuspendLayout();
            this.tabPage11.SuspendLayout();
            this.tabPage12.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabPage15.SuspendLayout();
            this.SuspendLayout();
            // 
            // buttonReadHexFile
            // 
            this.buttonReadHexFile.Location = new System.Drawing.Point(7, 28);
            this.buttonReadHexFile.Name = "buttonReadHexFile";
            this.buttonReadHexFile.Size = new System.Drawing.Size(100, 44);
            this.buttonReadHexFile.TabIndex = 0;
            this.buttonReadHexFile.Text = "Read From File";
            this.buttonReadHexFile.UseVisualStyleBackColor = true;
            this.buttonReadHexFile.Click += new System.EventHandler(this.buttonReadHexFile_Click);
            // 
            // openRawFileDialog
            // 
            this.openRawFileDialog.FileName = "openFileDialog1";
            this.openRawFileDialog.FileOk += new System.ComponentModel.CancelEventHandler(this.openawFileDialog_FileOk);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBox1.Location = new System.Drawing.Point(3, 0);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(957, 194);
            this.richTextBox1.TabIndex = 1;
            this.richTextBox1.Text = "";
            // 
            // labelBytesRead
            // 
            this.labelBytesRead.AutoSize = true;
            this.labelBytesRead.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelBytesRead.Location = new System.Drawing.Point(261, 28);
            this.labelBytesRead.Name = "labelBytesRead";
            this.labelBytesRead.Size = new System.Drawing.Size(59, 20);
            this.labelBytesRead.TabIndex = 2;
            this.labelBytesRead.Text = "Ready ";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(265, 110);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(114, 15);
            this.progressBar1.TabIndex = 3;
            this.progressBar1.Visible = false;
            // 
            // backgroundWorker1
            // 
            this.backgroundWorker1.WorkerReportsProgress = true;
            this.backgroundWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker1_DoWork);
            this.backgroundWorker1.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker1_ProgressChanged);
            // 
            // zedLazerEncoder
            // 
            this.zedLazerEncoder.Location = new System.Drawing.Point(6, 6);
            this.zedLazerEncoder.Name = "zedLazerEncoder";
            this.zedLazerEncoder.ScrollGrace = 0D;
            this.zedLazerEncoder.ScrollMaxX = 0D;
            this.zedLazerEncoder.ScrollMaxY = 0D;
            this.zedLazerEncoder.ScrollMaxY2 = 0D;
            this.zedLazerEncoder.ScrollMinX = 0D;
            this.zedLazerEncoder.ScrollMinY = 0D;
            this.zedLazerEncoder.ScrollMinY2 = 0D;
            this.zedLazerEncoder.Size = new System.Drawing.Size(1530, 241);
            this.zedLazerEncoder.TabIndex = 4;
            // 
            // buttonPlot
            // 
            this.buttonPlot.Location = new System.Drawing.Point(6, 82);
            this.buttonPlot.Name = "buttonPlot";
            this.buttonPlot.Size = new System.Drawing.Size(103, 43);
            this.buttonPlot.TabIndex = 5;
            this.buttonPlot.Text = "Plot Data";
            this.buttonPlot.UseVisualStyleBackColor = true;
            this.buttonPlot.Click += new System.EventHandler(this.buttonPlot_Click);
            // 
            // zedLaserTime
            // 
            this.zedLaserTime.Location = new System.Drawing.Point(3, 3);
            this.zedLaserTime.Name = "zedLaserTime";
            this.zedLaserTime.ScrollGrace = 0D;
            this.zedLaserTime.ScrollMaxX = 0D;
            this.zedLaserTime.ScrollMaxY = 0D;
            this.zedLaserTime.ScrollMaxY2 = 0D;
            this.zedLaserTime.ScrollMinX = 0D;
            this.zedLaserTime.ScrollMinY = 0D;
            this.zedLaserTime.ScrollMinY2 = 0D;
            this.zedLaserTime.Size = new System.Drawing.Size(1516, 241);
            this.zedLaserTime.TabIndex = 6;
            // 
            // zedEncoderTime
            // 
            this.zedEncoderTime.Location = new System.Drawing.Point(3, 0);
            this.zedEncoderTime.Name = "zedEncoderTime";
            this.zedEncoderTime.ScrollGrace = 0D;
            this.zedEncoderTime.ScrollMaxX = 0D;
            this.zedEncoderTime.ScrollMaxY = 0D;
            this.zedEncoderTime.ScrollMaxY2 = 0D;
            this.zedEncoderTime.ScrollMinX = 0D;
            this.zedEncoderTime.ScrollMinY = 0D;
            this.zedEncoderTime.ScrollMinY2 = 0D;
            this.zedEncoderTime.Size = new System.Drawing.Size(1513, 457);
            this.zedEncoderTime.TabIndex = 7;
            // 
            // zedEncoderDiff
            // 
            this.zedEncoderDiff.Location = new System.Drawing.Point(3, 250);
            this.zedEncoderDiff.Name = "zedEncoderDiff";
            this.zedEncoderDiff.ScrollGrace = 0D;
            this.zedEncoderDiff.ScrollMaxX = 0D;
            this.zedEncoderDiff.ScrollMaxY = 0D;
            this.zedEncoderDiff.ScrollMaxY2 = 0D;
            this.zedEncoderDiff.ScrollMinX = 0D;
            this.zedEncoderDiff.ScrollMinY = 0D;
            this.zedEncoderDiff.ScrollMinY2 = 0D;
            this.zedEncoderDiff.Size = new System.Drawing.Size(1516, 240);
            this.zedEncoderDiff.TabIndex = 8;
            // 
            // zedTabControl1
            // 
            this.zedTabControl1.Controls.Add(this.tabPage1);
            this.zedTabControl1.Controls.Add(this.tabPage2);
            this.zedTabControl1.Controls.Add(this.tabPage8);
            this.zedTabControl1.Controls.Add(this.tabPage9);
            this.zedTabControl1.Controls.Add(this.tabPage13);
            this.zedTabControl1.Location = new System.Drawing.Point(6, 200);
            this.zedTabControl1.Name = "zedTabControl1";
            this.zedTabControl1.SelectedIndex = 0;
            this.zedTabControl1.Size = new System.Drawing.Size(1530, 519);
            this.zedTabControl1.TabIndex = 9;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.zedLaserTime);
            this.tabPage1.Controls.Add(this.zedEncoderDiff);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1522, 493);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "diff";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.zedEncoderTime);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1522, 493);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "encoder";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tabPage8
            // 
            this.tabPage8.Controls.Add(this.zedAccTime);
            this.tabPage8.Location = new System.Drawing.Point(4, 22);
            this.tabPage8.Name = "tabPage8";
            this.tabPage8.Size = new System.Drawing.Size(1522, 493);
            this.tabPage8.TabIndex = 2;
            this.tabPage8.Text = "Acc";
            this.tabPage8.UseVisualStyleBackColor = true;
            // 
            // zedAccTime
            // 
            this.zedAccTime.Location = new System.Drawing.Point(9, 21);
            this.zedAccTime.Name = "zedAccTime";
            this.zedAccTime.ScrollGrace = 0D;
            this.zedAccTime.ScrollMaxX = 0D;
            this.zedAccTime.ScrollMaxY = 0D;
            this.zedAccTime.ScrollMaxY2 = 0D;
            this.zedAccTime.ScrollMinX = 0D;
            this.zedAccTime.ScrollMinY = 0D;
            this.zedAccTime.ScrollMinY2 = 0D;
            this.zedAccTime.Size = new System.Drawing.Size(1505, 450);
            this.zedAccTime.TabIndex = 6;
            // 
            // tabPage9
            // 
            this.tabPage9.Controls.Add(this.zedGyroTime);
            this.tabPage9.Location = new System.Drawing.Point(4, 22);
            this.tabPage9.Name = "tabPage9";
            this.tabPage9.Size = new System.Drawing.Size(1522, 493);
            this.tabPage9.TabIndex = 3;
            this.tabPage9.Text = "Gyro";
            this.tabPage9.UseVisualStyleBackColor = true;
            // 
            // zedGyroTime
            // 
            this.zedGyroTime.Location = new System.Drawing.Point(3, 9);
            this.zedGyroTime.Name = "zedGyroTime";
            this.zedGyroTime.ScrollGrace = 0D;
            this.zedGyroTime.ScrollMaxX = 0D;
            this.zedGyroTime.ScrollMaxY = 0D;
            this.zedGyroTime.ScrollMaxY2 = 0D;
            this.zedGyroTime.ScrollMinX = 0D;
            this.zedGyroTime.ScrollMinY = 0D;
            this.zedGyroTime.ScrollMinY2 = 0D;
            this.zedGyroTime.Size = new System.Drawing.Size(1505, 390);
            this.zedGyroTime.TabIndex = 6;
            // 
            // tabPage13
            // 
            this.tabPage13.Controls.Add(this.zedMagTime);
            this.tabPage13.Location = new System.Drawing.Point(4, 22);
            this.tabPage13.Name = "tabPage13";
            this.tabPage13.Size = new System.Drawing.Size(1522, 493);
            this.tabPage13.TabIndex = 4;
            this.tabPage13.Text = "Mag";
            this.tabPage13.UseVisualStyleBackColor = true;
            // 
            // zedMagTime
            // 
            this.zedMagTime.Location = new System.Drawing.Point(16, 12);
            this.zedMagTime.Name = "zedMagTime";
            this.zedMagTime.ScrollGrace = 0D;
            this.zedMagTime.ScrollMaxX = 0D;
            this.zedMagTime.ScrollMaxY = 0D;
            this.zedMagTime.ScrollMaxY2 = 0D;
            this.zedMagTime.ScrollMinX = 0D;
            this.zedMagTime.ScrollMinY = 0D;
            this.zedMagTime.ScrollMinY2 = 0D;
            this.zedMagTime.Size = new System.Drawing.Size(1516, 395);
            this.zedMagTime.TabIndex = 7;
            // 
            // tabControl2
            // 
            this.tabControl2.Controls.Add(this.tabPage3);
            this.tabControl2.Controls.Add(this.tabPage7);
            this.tabControl2.Controls.Add(this.tabPage14);
            this.tabControl2.Controls.Add(this.tabPage4);
            this.tabControl2.Location = new System.Drawing.Point(6, 253);
            this.tabControl2.Name = "tabControl2";
            this.tabControl2.SelectedIndex = 0;
            this.tabControl2.Size = new System.Drawing.Size(1533, 630);
            this.tabControl2.TabIndex = 10;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.zedAcc);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(1525, 604);
            this.tabPage3.TabIndex = 0;
            this.tabPage3.Text = "Accelerometer";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // zedAcc
            // 
            this.zedAcc.Location = new System.Drawing.Point(5, 3);
            this.zedAcc.Name = "zedAcc";
            this.zedAcc.ScrollGrace = 0D;
            this.zedAcc.ScrollMaxX = 0D;
            this.zedAcc.ScrollMaxY = 0D;
            this.zedAcc.ScrollMaxY2 = 0D;
            this.zedAcc.ScrollMinX = 0D;
            this.zedAcc.ScrollMinY = 0D;
            this.zedAcc.ScrollMinY2 = 0D;
            this.zedAcc.Size = new System.Drawing.Size(1505, 450);
            this.zedAcc.TabIndex = 5;
            // 
            // tabPage7
            // 
            this.tabPage7.Controls.Add(this.zedGyro);
            this.tabPage7.Location = new System.Drawing.Point(4, 22);
            this.tabPage7.Name = "tabPage7";
            this.tabPage7.Size = new System.Drawing.Size(1525, 604);
            this.tabPage7.TabIndex = 2;
            this.tabPage7.Text = "Gyro";
            this.tabPage7.UseVisualStyleBackColor = true;
            // 
            // zedGyro
            // 
            this.zedGyro.Location = new System.Drawing.Point(7, 22);
            this.zedGyro.Name = "zedGyro";
            this.zedGyro.ScrollGrace = 0D;
            this.zedGyro.ScrollMaxX = 0D;
            this.zedGyro.ScrollMaxY = 0D;
            this.zedGyro.ScrollMaxY2 = 0D;
            this.zedGyro.ScrollMinX = 0D;
            this.zedGyro.ScrollMinY = 0D;
            this.zedGyro.ScrollMinY2 = 0D;
            this.zedGyro.Size = new System.Drawing.Size(1519, 313);
            this.zedGyro.TabIndex = 7;
            // 
            // tabPage14
            // 
            this.tabPage14.Controls.Add(this.zedMag);
            this.tabPage14.Location = new System.Drawing.Point(4, 22);
            this.tabPage14.Name = "tabPage14";
            this.tabPage14.Size = new System.Drawing.Size(1525, 604);
            this.tabPage14.TabIndex = 3;
            this.tabPage14.Text = "Mag";
            this.tabPage14.UseVisualStyleBackColor = true;
            // 
            // zedMag
            // 
            this.zedMag.Location = new System.Drawing.Point(3, 8);
            this.zedMag.Name = "zedMag";
            this.zedMag.ScrollGrace = 0D;
            this.zedMag.ScrollMaxX = 0D;
            this.zedMag.ScrollMaxY = 0D;
            this.zedMag.ScrollMaxY2 = 0D;
            this.zedMag.ScrollMinX = 0D;
            this.zedMag.ScrollMinY = 0D;
            this.zedMag.ScrollMinY2 = 0D;
            this.zedMag.Size = new System.Drawing.Size(1505, 450);
            this.zedMag.TabIndex = 6;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.zedRoll);
            this.tabPage4.Controls.Add(this.zedPitch);
            this.tabPage4.Location = new System.Drawing.Point(4, 22);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(1525, 604);
            this.tabPage4.TabIndex = 1;
            this.tabPage4.Text = "Inclinometor";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // zedRoll
            // 
            this.zedRoll.Location = new System.Drawing.Point(6, 215);
            this.zedRoll.Name = "zedRoll";
            this.zedRoll.ScrollGrace = 0D;
            this.zedRoll.ScrollMaxX = 0D;
            this.zedRoll.ScrollMaxY = 0D;
            this.zedRoll.ScrollMaxY2 = 0D;
            this.zedRoll.ScrollMinX = 0D;
            this.zedRoll.ScrollMinY = 0D;
            this.zedRoll.ScrollMinY2 = 0D;
            this.zedRoll.Size = new System.Drawing.Size(1398, 216);
            this.zedRoll.TabIndex = 7;
            // 
            // zedPitch
            // 
            this.zedPitch.Location = new System.Drawing.Point(5, 13);
            this.zedPitch.Name = "zedPitch";
            this.zedPitch.ScrollGrace = 0D;
            this.zedPitch.ScrollMaxX = 0D;
            this.zedPitch.ScrollMaxY = 0D;
            this.zedPitch.ScrollMaxY2 = 0D;
            this.zedPitch.ScrollMinX = 0D;
            this.zedPitch.ScrollMinY = 0D;
            this.zedPitch.ScrollMinY2 = 0D;
            this.zedPitch.Size = new System.Drawing.Size(1399, 196);
            this.zedPitch.TabIndex = 6;
            // 
            // tabControl3
            // 
            this.tabControl3.Controls.Add(this.tabPage5);
            this.tabControl3.Controls.Add(this.tabPage6);
            this.tabControl3.ItemSize = new System.Drawing.Size(100, 38);
            this.tabControl3.Location = new System.Drawing.Point(7, 154);
            this.tabControl3.Name = "tabControl3";
            this.tabControl3.SelectedIndex = 0;
            this.tabControl3.Size = new System.Drawing.Size(1550, 836);
            this.tabControl3.TabIndex = 11;
            // 
            // tabPage5
            // 
            this.tabPage5.Controls.Add(this.richTextBox1);
            this.tabPage5.Controls.Add(this.zedTabControl1);
            this.tabPage5.Location = new System.Drawing.Point(4, 42);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(1542, 790);
            this.tabPage5.TabIndex = 0;
            this.tabPage5.Text = "Debug";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // tabPage6
            // 
            this.tabPage6.Controls.Add(this.zedLazerEncoder);
            this.tabPage6.Controls.Add(this.tabControl2);
            this.tabPage6.Location = new System.Drawing.Point(4, 42);
            this.tabPage6.Name = "tabPage6";
            this.tabPage6.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage6.Size = new System.Drawing.Size(1542, 790);
            this.tabPage6.TabIndex = 1;
            this.tabPage6.Text = "Output";
            this.tabPage6.UseVisualStyleBackColor = true;
            // 
            // buttonWrite
            // 
            this.buttonWrite.Location = new System.Drawing.Point(130, 82);
            this.buttonWrite.Name = "buttonWrite";
            this.buttonWrite.Size = new System.Drawing.Size(94, 43);
            this.buttonWrite.TabIndex = 12;
            this.buttonWrite.Text = "Write CSV";
            this.buttonWrite.UseVisualStyleBackColor = true;
            this.buttonWrite.Click += new System.EventHandler(this.buttonWriteRawCSV_Click);
            // 
            // tabControl4
            // 
            this.tabControl4.Controls.Add(this.tabPage10);
            this.tabControl4.Controls.Add(this.tabPage11);
            this.tabControl4.Controls.Add(this.tabPage12);
            this.tabControl4.Controls.Add(this.tabPage15);
            this.tabControl4.ItemSize = new System.Drawing.Size(100, 38);
            this.tabControl4.Location = new System.Drawing.Point(1, 3);
            this.tabControl4.Name = "tabControl4";
            this.tabControl4.SelectedIndex = 0;
            this.tabControl4.Size = new System.Drawing.Size(1740, 971);
            this.tabControl4.TabIndex = 13;
            // 
            // tabPage10
            // 
            this.tabPage10.Controls.Add(this.labelWritingStatus);
            this.tabPage10.Controls.Add(this.checkBoxShowText);
            this.tabPage10.Controls.Add(this.progressBar1);
            this.tabPage10.Controls.Add(this.buttonWrite);
            this.tabPage10.Controls.Add(this.buttonReadHexFile);
            this.tabPage10.Controls.Add(this.tabControl3);
            this.tabPage10.Controls.Add(this.labelBytesRead);
            this.tabPage10.Controls.Add(this.buttonPlot);
            this.tabPage10.Location = new System.Drawing.Point(4, 42);
            this.tabPage10.Name = "tabPage10";
            this.tabPage10.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage10.Size = new System.Drawing.Size(1732, 925);
            this.tabPage10.TabIndex = 0;
            this.tabPage10.Text = "Read Raw";
            this.tabPage10.UseVisualStyleBackColor = true;
            // 
            // labelWritingStatus
            // 
            this.labelWritingStatus.AutoSize = true;
            this.labelWritingStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelWritingStatus.Location = new System.Drawing.Point(643, 32);
            this.labelWritingStatus.Name = "labelWritingStatus";
            this.labelWritingStatus.Size = new System.Drawing.Size(17, 20);
            this.labelWritingStatus.TabIndex = 13;
            this.labelWritingStatus.Text = "..";
            // 
            // checkBoxShowText
            // 
            this.checkBoxShowText.Checked = true;
            this.checkBoxShowText.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBoxShowText.Location = new System.Drawing.Point(130, 32);
            this.checkBoxShowText.Name = "checkBoxShowText";
            this.checkBoxShowText.Size = new System.Drawing.Size(100, 50);
            this.checkBoxShowText.TabIndex = 11;
            this.checkBoxShowText.Text = "Show Text";
            this.checkBoxShowText.UseVisualStyleBackColor = true;
            // 
            // tabPage11
            // 
            this.tabPage11.Controls.Add(this.geWebBrowserSingle);
            this.tabPage11.Controls.Add(this.labelAppendCSVStatus);
            this.tabPage11.Controls.Add(this.buttonAppendToCSV);
            this.tabPage11.Controls.Add(this.richTextBoxGPS);
            this.tabPage11.Controls.Add(this.label2);
            this.tabPage11.Controls.Add(this.buttonReadGPS);
            this.tabPage11.Location = new System.Drawing.Point(4, 42);
            this.tabPage11.Name = "tabPage11";
            this.tabPage11.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage11.Size = new System.Drawing.Size(1732, 925);
            this.tabPage11.TabIndex = 1;
            this.tabPage11.Text = "Read GPS";
            this.tabPage11.UseVisualStyleBackColor = true;
            // 
            // geWebBrowserSingle
            // 
            this.geWebBrowserSingle.ImageryBase = FC.GEPluginCtrls.ImageryBase.Earth;
            this.geWebBrowserSingle.IsWebBrowserContextMenuEnabled = false;
            this.geWebBrowserSingle.Location = new System.Drawing.Point(653, 128);
            this.geWebBrowserSingle.MinimumSize = new System.Drawing.Size(20, 20);
            this.geWebBrowserSingle.Name = "geWebBrowserSingle";
            this.geWebBrowserSingle.RedirectLinksToSystemBrowser = false;
            this.geWebBrowserSingle.ScrollBarsEnabled = false;
            this.geWebBrowserSingle.Size = new System.Drawing.Size(926, 655);
            this.geWebBrowserSingle.TabIndex = 6;
            this.geWebBrowserSingle.WebBrowserShortcutsEnabled = false;
            // 
            // labelAppendCSVStatus
            // 
            this.labelAppendCSVStatus.AutoSize = true;
            this.labelAppendCSVStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelAppendCSVStatus.Location = new System.Drawing.Point(441, 35);
            this.labelAppendCSVStatus.Name = "labelAppendCSVStatus";
            this.labelAppendCSVStatus.Size = new System.Drawing.Size(0, 20);
            this.labelAppendCSVStatus.TabIndex = 5;
            // 
            // buttonAppendToCSV
            // 
            this.buttonAppendToCSV.Location = new System.Drawing.Point(237, 35);
            this.buttonAppendToCSV.Name = "buttonAppendToCSV";
            this.buttonAppendToCSV.Size = new System.Drawing.Size(152, 54);
            this.buttonAppendToCSV.TabIndex = 4;
            this.buttonAppendToCSV.Text = "Append To CSV";
            this.buttonAppendToCSV.UseVisualStyleBackColor = true;
            this.buttonAppendToCSV.Click += new System.EventHandler(this.buttonAppendToCSV_Click);
            // 
            // richTextBoxGPS
            // 
            this.richTextBoxGPS.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBoxGPS.Location = new System.Drawing.Point(10, 128);
            this.richTextBoxGPS.Name = "richTextBoxGPS";
            this.richTextBoxGPS.Size = new System.Drawing.Size(480, 655);
            this.richTextBoxGPS.TabIndex = 3;
            this.richTextBoxGPS.Text = "";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(49, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "GPS text";
            // 
            // buttonReadGPS
            // 
            this.buttonReadGPS.Location = new System.Drawing.Point(10, 35);
            this.buttonReadGPS.Name = "buttonReadGPS";
            this.buttonReadGPS.Size = new System.Drawing.Size(134, 54);
            this.buttonReadGPS.TabIndex = 0;
            this.buttonReadGPS.Text = "Read From File";
            this.buttonReadGPS.UseVisualStyleBackColor = true;
            this.buttonReadGPS.Click += new System.EventHandler(this.buttonReadGPS_Click);
            // 
            // tabPage12
            // 
            this.tabPage12.Controls.Add(this.checkBoxGPSmapUpdate);
            this.tabPage12.Controls.Add(this.geWebBrowser1);
            this.tabPage12.Controls.Add(this.buttonClearMap);
            this.tabPage12.Controls.Add(this.listView);
            this.tabPage12.Controls.Add(this.progressBarTotalProgress);
            this.tabPage12.Controls.Add(this.progressBarCurrentFileProgress);
            this.tabPage12.Controls.Add(this.labelTranslatingProgress);
            this.tabPage12.Controls.Add(this.label1);
            this.tabPage12.Controls.Add(this.buttonStartTranslation);
            this.tabPage12.Controls.Add(this.groupBox1);
            this.tabPage12.Location = new System.Drawing.Point(4, 42);
            this.tabPage12.Name = "tabPage12";
            this.tabPage12.Size = new System.Drawing.Size(1732, 925);
            this.tabPage12.TabIndex = 2;
            this.tabPage12.Text = "Read Whole Bunch";
            this.tabPage12.UseVisualStyleBackColor = true;
            // 
            // checkBoxGPSmapUpdate
            // 
            this.checkBoxGPSmapUpdate.AutoSize = true;
            this.checkBoxGPSmapUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.checkBoxGPSmapUpdate.Location = new System.Drawing.Point(607, 36);
            this.checkBoxGPSmapUpdate.Name = "checkBoxGPSmapUpdate";
            this.checkBoxGPSmapUpdate.Size = new System.Drawing.Size(205, 24);
            this.checkBoxGPSmapUpdate.TabIndex = 13;
            this.checkBoxGPSmapUpdate.Text = "GPS Live update on Map";
            this.checkBoxGPSmapUpdate.UseVisualStyleBackColor = true;
            // 
            // geWebBrowser1
            // 
            this.geWebBrowser1.ImageryBase = FC.GEPluginCtrls.ImageryBase.Earth;
            this.geWebBrowser1.IsWebBrowserContextMenuEnabled = false;
            this.geWebBrowser1.Location = new System.Drawing.Point(867, 356);
            this.geWebBrowser1.MinimumSize = new System.Drawing.Size(20, 20);
            this.geWebBrowser1.Name = "geWebBrowser1";
            this.geWebBrowser1.RedirectLinksToSystemBrowser = false;
            this.geWebBrowser1.ScrollBarsEnabled = false;
            this.geWebBrowser1.Size = new System.Drawing.Size(712, 461);
            this.geWebBrowser1.TabIndex = 12;
            this.geWebBrowser1.WebBrowserShortcutsEnabled = false;
            // 
            // buttonClearMap
            // 
            this.buttonClearMap.Location = new System.Drawing.Point(710, 590);
            this.buttonClearMap.Name = "buttonClearMap";
            this.buttonClearMap.Size = new System.Drawing.Size(126, 61);
            this.buttonClearMap.TabIndex = 11;
            this.buttonClearMap.Text = "Clear map";
            this.buttonClearMap.UseVisualStyleBackColor = true;
            this.buttonClearMap.Click += new System.EventHandler(this.buttonClearMap_Click);
            // 
            // listView
            // 
            this.listView.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView.GridLines = true;
            this.listView.Location = new System.Drawing.Point(867, 44);
            this.listView.Name = "listView";
            this.listView.Size = new System.Drawing.Size(712, 241);
            this.listView.TabIndex = 9;
            this.listView.UseCompatibleStateImageBehavior = false;
            this.listView.View = System.Windows.Forms.View.Details;
            // 
            // progressBarTotalProgress
            // 
            this.progressBarTotalProgress.Location = new System.Drawing.Point(607, 314);
            this.progressBarTotalProgress.Name = "progressBarTotalProgress";
            this.progressBarTotalProgress.Size = new System.Drawing.Size(100, 23);
            this.progressBarTotalProgress.TabIndex = 8;
            // 
            // progressBarCurrentFileProgress
            // 
            this.progressBarCurrentFileProgress.Location = new System.Drawing.Point(607, 223);
            this.progressBarCurrentFileProgress.Name = "progressBarCurrentFileProgress";
            this.progressBarCurrentFileProgress.Size = new System.Drawing.Size(100, 23);
            this.progressBarCurrentFileProgress.TabIndex = 7;
            // 
            // labelTranslatingProgress
            // 
            this.labelTranslatingProgress.AutoSize = true;
            this.labelTranslatingProgress.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelTranslatingProgress.Location = new System.Drawing.Point(863, 296);
            this.labelTranslatingProgress.Name = "labelTranslatingProgress";
            this.labelTranslatingProgress.Size = new System.Drawing.Size(53, 20);
            this.labelTranslatingProgress.TabIndex = 6;
            this.labelTranslatingProgress.Text = "status";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(0, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "label1";
            // 
            // buttonStartTranslation
            // 
            this.buttonStartTranslation.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonStartTranslation.Location = new System.Drawing.Point(607, 90);
            this.buttonStartTranslation.Name = "buttonStartTranslation";
            this.buttonStartTranslation.Size = new System.Drawing.Size(229, 84);
            this.buttonStartTranslation.TabIndex = 4;
            this.buttonStartTranslation.Text = "Start translating";
            this.buttonStartTranslation.UseVisualStyleBackColor = true;
            this.buttonStartTranslation.Click += new System.EventHandler(this.buttonStartTranslation_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.labelDSLRPath);
            this.groupBox1.Controls.Add(this.buttonSetDSLRPath);
            this.groupBox1.Controls.Add(this.labelGPSInputPath);
            this.groupBox1.Controls.Add(this.labelRawInputPath);
            this.groupBox1.Controls.Add(this.labelCSVOuputPath);
            this.groupBox1.Controls.Add(this.buttonSetCSVPath);
            this.groupBox1.Controls.Add(this.buttonSetGPSInputPath);
            this.groupBox1.Controls.Add(this.buttonSetRawInputPath);
            this.groupBox1.Location = new System.Drawing.Point(19, 36);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(523, 457);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "File Path Settings";
            // 
            // labelDSLRPath
            // 
            this.labelDSLRPath.AutoSize = true;
            this.labelDSLRPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDSLRPath.Location = new System.Drawing.Point(218, 353);
            this.labelDSLRPath.Name = "labelDSLRPath";
            this.labelDSLRPath.Size = new System.Drawing.Size(63, 20);
            this.labelDSLRPath.TabIndex = 11;
            this.labelDSLRPath.Text = "Not Set";
            // 
            // buttonSetDSLRPath
            // 
            this.buttonSetDSLRPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetDSLRPath.Location = new System.Drawing.Point(16, 320);
            this.buttonSetDSLRPath.Name = "buttonSetDSLRPath";
            this.buttonSetDSLRPath.Size = new System.Drawing.Size(184, 86);
            this.buttonSetDSLRPath.TabIndex = 10;
            this.buttonSetDSLRPath.Text = "Set DSLR input Path";
            this.buttonSetDSLRPath.UseVisualStyleBackColor = true;
            this.buttonSetDSLRPath.Click += new System.EventHandler(this.buttonSetDSLRPath_Click);
            // 
            // labelGPSInputPath
            // 
            this.labelGPSInputPath.AutoSize = true;
            this.labelGPSInputPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelGPSInputPath.Location = new System.Drawing.Point(218, 260);
            this.labelGPSInputPath.Name = "labelGPSInputPath";
            this.labelGPSInputPath.Size = new System.Drawing.Size(63, 20);
            this.labelGPSInputPath.TabIndex = 9;
            this.labelGPSInputPath.Text = "Not Set";
            // 
            // labelRawInputPath
            // 
            this.labelRawInputPath.AutoSize = true;
            this.labelRawInputPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelRawInputPath.Location = new System.Drawing.Point(218, 167);
            this.labelRawInputPath.Name = "labelRawInputPath";
            this.labelRawInputPath.Size = new System.Drawing.Size(63, 20);
            this.labelRawInputPath.TabIndex = 8;
            this.labelRawInputPath.Text = "Not Set";
            // 
            // labelCSVOuputPath
            // 
            this.labelCSVOuputPath.AutoSize = true;
            this.labelCSVOuputPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelCSVOuputPath.Location = new System.Drawing.Point(218, 72);
            this.labelCSVOuputPath.Name = "labelCSVOuputPath";
            this.labelCSVOuputPath.Size = new System.Drawing.Size(63, 20);
            this.labelCSVOuputPath.TabIndex = 7;
            this.labelCSVOuputPath.Text = "Not Set";
            // 
            // buttonSetCSVPath
            // 
            this.buttonSetCSVPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetCSVPath.Location = new System.Drawing.Point(15, 45);
            this.buttonSetCSVPath.Name = "buttonSetCSVPath";
            this.buttonSetCSVPath.Size = new System.Drawing.Size(185, 84);
            this.buttonSetCSVPath.TabIndex = 0;
            this.buttonSetCSVPath.Text = "Set CSV output Path";
            this.buttonSetCSVPath.UseVisualStyleBackColor = true;
            this.buttonSetCSVPath.Click += new System.EventHandler(this.buttonSetCSVPath_Click);
            // 
            // buttonSetGPSInputPath
            // 
            this.buttonSetGPSInputPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetGPSInputPath.Location = new System.Drawing.Point(16, 226);
            this.buttonSetGPSInputPath.Name = "buttonSetGPSInputPath";
            this.buttonSetGPSInputPath.Size = new System.Drawing.Size(184, 88);
            this.buttonSetGPSInputPath.TabIndex = 2;
            this.buttonSetGPSInputPath.Text = "Set GPS input Path";
            this.buttonSetGPSInputPath.UseVisualStyleBackColor = true;
            this.buttonSetGPSInputPath.Click += new System.EventHandler(this.buttonSetGPSInputPath_Click);
            // 
            // buttonSetRawInputPath
            // 
            this.buttonSetRawInputPath.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetRawInputPath.Location = new System.Drawing.Point(15, 135);
            this.buttonSetRawInputPath.Name = "buttonSetRawInputPath";
            this.buttonSetRawInputPath.Size = new System.Drawing.Size(185, 85);
            this.buttonSetRawInputPath.TabIndex = 1;
            this.buttonSetRawInputPath.Text = "Set Raw File input Path";
            this.buttonSetRawInputPath.UseVisualStyleBackColor = true;
            this.buttonSetRawInputPath.Click += new System.EventHandler(this.buttonSetRawInputPath_Click);
            // 
            // tabPage15
            // 
            this.tabPage15.Controls.Add(this.label3);
            this.tabPage15.Controls.Add(this.buttonKMLTabGPSPath);
            this.tabPage15.Location = new System.Drawing.Point(4, 42);
            this.tabPage15.Name = "tabPage15";
            this.tabPage15.Size = new System.Drawing.Size(1732, 925);
            this.tabPage15.TabIndex = 3;
            this.tabPage15.Text = "Make KMLs";
            this.tabPage15.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(235, 20);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(33, 20);
            this.label3.TabIndex = 1;
            this.label3.Text = "null";
            // 
            // buttonKMLTabGPSPath
            // 
            this.buttonKMLTabGPSPath.Location = new System.Drawing.Point(7, 20);
            this.buttonKMLTabGPSPath.Name = "buttonKMLTabGPSPath";
            this.buttonKMLTabGPSPath.Size = new System.Drawing.Size(177, 60);
            this.buttonKMLTabGPSPath.TabIndex = 0;
            this.buttonKMLTabGPSPath.Text = "Set GPS folder";
            this.buttonKMLTabGPSPath.UseVisualStyleBackColor = true;
            this.buttonKMLTabGPSPath.Click += new System.EventHandler(this.buttonKMLTabGPSPath_Click);
            // 
            // openGPSFileDialog
            // 
            this.openGPSFileDialog.FileName = "openFileDialog2";
            this.openGPSFileDialog.FileOk += new System.ComponentModel.CancelEventHandler(this.openGPSFileDialog_FileOk);
            // 
            // backgroundWorker2
            // 
            this.backgroundWorker2.WorkerReportsProgress = true;
            this.backgroundWorker2.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker2_DoWork);
            this.backgroundWorker2.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker2_ProgressChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1596, 874);
            this.Controls.Add(this.tabControl4);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "PathMeT Data Interpreter ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.zedTabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage8.ResumeLayout(false);
            this.tabPage9.ResumeLayout(false);
            this.tabPage13.ResumeLayout(false);
            this.tabControl2.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.tabPage7.ResumeLayout(false);
            this.tabPage14.ResumeLayout(false);
            this.tabPage4.ResumeLayout(false);
            this.tabControl3.ResumeLayout(false);
            this.tabPage5.ResumeLayout(false);
            this.tabPage6.ResumeLayout(false);
            this.tabControl4.ResumeLayout(false);
            this.tabPage10.ResumeLayout(false);
            this.tabPage10.PerformLayout();
            this.tabPage11.ResumeLayout(false);
            this.tabPage11.PerformLayout();
            this.tabPage12.ResumeLayout(false);
            this.tabPage12.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tabPage15.ResumeLayout(false);
            this.tabPage15.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonReadHexFile;
        private System.Windows.Forms.OpenFileDialog openRawFileDialog;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label labelBytesRead;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private ZedGraph.ZedGraphControl zedLazerEncoder;
        private System.Windows.Forms.Button buttonPlot;
        private ZedGraph.ZedGraphControl zedLaserTime;
        private ZedGraph.ZedGraphControl zedEncoderTime;
        private ZedGraph.ZedGraphControl zedEncoderDiff;
        private System.Windows.Forms.TabControl zedTabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabControl tabControl2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TabPage tabPage4;
        private ZedGraph.ZedGraphControl zedAcc;
        private ZedGraph.ZedGraphControl zedRoll;
        private ZedGraph.ZedGraphControl zedPitch;
        private System.Windows.Forms.TabControl tabControl3;
        private System.Windows.Forms.TabPage tabPage5;
        private System.Windows.Forms.TabPage tabPage6;
        private System.Windows.Forms.Button buttonWrite;
        private System.Windows.Forms.TabPage tabPage7;
        private ZedGraph.ZedGraphControl zedGyro;
        private System.Windows.Forms.TabPage tabPage8;
        private ZedGraph.ZedGraphControl zedAccTime;
        private System.Windows.Forms.TabPage tabPage9;
        private ZedGraph.ZedGraphControl zedGyroTime;
        private System.Windows.Forms.TabControl tabControl4;
        private System.Windows.Forms.TabPage tabPage10;
        private System.Windows.Forms.TabPage tabPage11;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button buttonReadGPS;
        private System.Windows.Forms.OpenFileDialog openGPSFileDialog;
        private System.Windows.Forms.CheckBox checkBoxShowText;
        private System.Windows.Forms.RichTextBox richTextBoxGPS;
        private System.Windows.Forms.Button buttonAppendToCSV;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.TabPage tabPage12;
        private System.Windows.Forms.Label labelWritingStatus;
        private System.Windows.Forms.Label labelAppendCSVStatus;
        private System.Windows.Forms.Label labelTranslatingProgress;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button buttonStartTranslation;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button buttonSetCSVPath;
        private System.Windows.Forms.Button buttonSetGPSInputPath;
        private System.Windows.Forms.Button buttonSetRawInputPath;
        private System.ComponentModel.BackgroundWorker backgroundWorker2;
        private System.Windows.Forms.ProgressBar progressBarTotalProgress;
        private System.Windows.Forms.ProgressBar progressBarCurrentFileProgress;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialogFileFolderPath;
        private System.Windows.Forms.Label labelGPSInputPath;
        private System.Windows.Forms.Label labelRawInputPath;
        private System.Windows.Forms.Label labelCSVOuputPath;
        private System.Windows.Forms.ListView listView;
        private System.Windows.Forms.Button buttonSetDSLRPath;
        private System.Windows.Forms.Label labelDSLRPath;
        private System.ComponentModel.BackgroundWorker backgroundWorker3;
        private System.Windows.Forms.Button buttonClearMap;
        private FC.GEPluginCtrls.GEWebBrowser geWebBrowser1;
        private FC.GEPluginCtrls.GEWebBrowser geWebBrowserSingle;
        private System.Windows.Forms.TabPage tabPage13;
        private ZedGraph.ZedGraphControl zedMagTime;
        private System.Windows.Forms.TabPage tabPage14;
        private ZedGraph.ZedGraphControl zedMag;
        private System.Windows.Forms.TabPage tabPage15;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button buttonKMLTabGPSPath;
        private System.Windows.Forms.CheckBox checkBoxGPSmapUpdate;
    }
}

