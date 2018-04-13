namespace WindowsFormsApplication1
{
    partial class accountant
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.book = new System.Windows.Forms.DataGridView();
            this.startime = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.endtime = new System.Windows.Forms.DateTimePicker();
            this.check = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.salenum = new System.Windows.Forms.TextBox();
            this.salemoney = new System.Windows.Forms.TextBox();
            this.lcode = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.snum = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tmoney = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.book)).BeginInit();
            this.SuspendLayout();
            // 
            // book
            // 
            this.book.AllowUserToAddRows = false;
            this.book.AllowUserToDeleteRows = false;
            this.book.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.book.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.book.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.book.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.book.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.book.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.lcode,
            this.sname,
            this.snum,
            this.tmoney});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.book.DefaultCellStyle = dataGridViewCellStyle2;
            this.book.Location = new System.Drawing.Point(12, 62);
            this.book.Name = "book";
            this.book.ReadOnly = true;
            this.book.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            this.book.RowTemplate.Height = 23;
            this.book.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.book.Size = new System.Drawing.Size(1129, 423);
            this.book.TabIndex = 0;
            this.book.RowStateChanged += new System.Windows.Forms.DataGridViewRowStateChangedEventHandler(this.book_RowStateChanged);
            // 
            // startime
            // 
            this.startime.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.startime.CalendarFont = new System.Drawing.Font("宋体", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.startime.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.startime.Location = new System.Drawing.Point(203, 12);
            this.startime.Name = "startime";
            this.startime.Size = new System.Drawing.Size(200, 35);
            this.startime.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(67, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(130, 24);
            this.label1.TabIndex = 3;
            this.label1.Text = "开始时间：";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label2.Location = new System.Drawing.Point(479, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 24);
            this.label2.TabIndex = 5;
            this.label2.Text = "截止时间：";
            // 
            // endtime
            // 
            this.endtime.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.endtime.CalendarFont = new System.Drawing.Font("宋体", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.endtime.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.endtime.Location = new System.Drawing.Point(615, 12);
            this.endtime.Name = "endtime";
            this.endtime.Size = new System.Drawing.Size(200, 35);
            this.endtime.TabIndex = 4;
            // 
            // check
            // 
            this.check.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.check.Font = new System.Drawing.Font("宋体", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.check.Location = new System.Drawing.Point(927, 12);
            this.check.Name = "check";
            this.check.Size = new System.Drawing.Size(155, 37);
            this.check.TabIndex = 6;
            this.check.Text = "查询";
            this.check.UseVisualStyleBackColor = true;
            this.check.Click += new System.EventHandler(this.check_Click);
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("宋体", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label3.Location = new System.Drawing.Point(12, 543);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(348, 35);
            this.label3.TabIndex = 7;
            this.label3.Text = "该时段一共卖出商品 ";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("宋体", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label4.Location = new System.Drawing.Point(563, 543);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(208, 35);
            this.label4.TabIndex = 8;
            this.label4.Text = "件，共计 ￥";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("宋体", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label5.Location = new System.Drawing.Point(1056, 543);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(85, 35);
            this.label5.TabIndex = 9;
            this.label5.Text = "元。";
            // 
            // salenum
            // 
            this.salenum.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.salenum.BackColor = System.Drawing.SystemColors.Control;
            this.salenum.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.salenum.Enabled = false;
            this.salenum.Font = new System.Drawing.Font("宋体", 36F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.salenum.Location = new System.Drawing.Point(384, 529);
            this.salenum.Name = "salenum";
            this.salenum.ReadOnly = true;
            this.salenum.Size = new System.Drawing.Size(161, 55);
            this.salenum.TabIndex = 10;
            this.salenum.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // salemoney
            // 
            this.salemoney.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.salemoney.BackColor = System.Drawing.SystemColors.Control;
            this.salemoney.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.salemoney.Enabled = false;
            this.salemoney.Font = new System.Drawing.Font("宋体", 36F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.salemoney.Location = new System.Drawing.Point(822, 529);
            this.salemoney.Name = "salemoney";
            this.salemoney.ReadOnly = true;
            this.salemoney.Size = new System.Drawing.Size(203, 55);
            this.salemoney.TabIndex = 11;
            this.salemoney.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lcode
            // 
            this.lcode.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.lcode.HeaderText = "条形码";
            this.lcode.Name = "lcode";
            this.lcode.ReadOnly = true;
            // 
            // sname
            // 
            this.sname.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.sname.HeaderText = "商品名";
            this.sname.Name = "sname";
            this.sname.ReadOnly = true;
            // 
            // snum
            // 
            this.snum.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.snum.HeaderText = "销售数量";
            this.snum.Name = "snum";
            this.snum.ReadOnly = true;
            // 
            // tmoney
            // 
            this.tmoney.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.tmoney.HeaderText = "金额";
            this.tmoney.Name = "tmoney";
            this.tmoney.ReadOnly = true;
            // 
            // accountant
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1153, 628);
            this.Controls.Add(this.salemoney);
            this.Controls.Add(this.salenum);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.check);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.endtime);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.startime);
            this.Controls.Add(this.book);
            this.Name = "accountant";
            this.Text = "营业账本";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.accountant_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.book)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker startime;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker endtime;
        private System.Windows.Forms.Button check;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox salenum;
        private System.Windows.Forms.TextBox salemoney;
        private System.Windows.Forms.DataGridViewTextBoxColumn lcode;
        private System.Windows.Forms.DataGridViewTextBoxColumn sname;
        private System.Windows.Forms.DataGridViewTextBoxColumn snum;
        private System.Windows.Forms.DataGridViewTextBoxColumn tmoney;
        private System.Windows.Forms.DataGridView book;
    }
}