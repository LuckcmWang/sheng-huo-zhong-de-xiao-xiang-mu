namespace WindowsFormsApplication1
{
    partial class worktime
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.lcode_in = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.saleslist = new System.Windows.Forms.DataGridView();
            this.lcode_col = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sname_col = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.price_col = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clear_all = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.totalcost = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.saleslist)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.lcode_in);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(981, 114);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("宋体", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(33, 46);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(231, 29);
            this.label1.TabIndex = 1;
            this.label1.Text = "条形码输入区 ：";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // lcode_in
            // 
            this.lcode_in.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lcode_in.Font = new System.Drawing.Font("宋体", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lcode_in.Location = new System.Drawing.Point(310, 38);
            this.lcode_in.Name = "lcode_in";
            this.lcode_in.Size = new System.Drawing.Size(624, 47);
            this.lcode_in.TabIndex = 0;
            this.lcode_in.TextChanged += new System.EventHandler(this.lcode_in_TextChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.saleslist);
            this.groupBox2.Font = new System.Drawing.Font("宋体", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.groupBox2.Location = new System.Drawing.Point(12, 143);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(981, 344);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "商品计价";
            this.groupBox2.Enter += new System.EventHandler(this.groupBox2_Enter);
            // 
            // saleslist
            // 
            this.saleslist.AllowUserToAddRows = false;
            this.saleslist.AllowUserToDeleteRows = false;
            this.saleslist.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.saleslist.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.saleslist.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.saleslist.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.saleslist.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.lcode_col,
            this.sname_col,
            this.price_col});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.saleslist.DefaultCellStyle = dataGridViewCellStyle2;
            this.saleslist.Location = new System.Drawing.Point(14, 29);
            this.saleslist.Name = "saleslist";
            this.saleslist.ReadOnly = true;
            this.saleslist.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            this.saleslist.RowTemplate.Height = 23;
            this.saleslist.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.saleslist.Size = new System.Drawing.Size(949, 296);
            this.saleslist.TabIndex = 0;
            this.saleslist.RowStateChanged += new System.Windows.Forms.DataGridViewRowStateChangedEventHandler(this.saleslist_RowStateChanged);
            // 
            // lcode_col
            // 
            this.lcode_col.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.lcode_col.HeaderText = "商品条形码";
            this.lcode_col.Name = "lcode_col";
            this.lcode_col.ReadOnly = true;
            // 
            // sname_col
            // 
            this.sname_col.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.sname_col.HeaderText = "商品名称";
            this.sname_col.Name = "sname_col";
            this.sname_col.ReadOnly = true;
            // 
            // price_col
            // 
            this.price_col.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.price_col.HeaderText = "价格";
            this.price_col.Name = "price_col";
            this.price_col.ReadOnly = true;
            // 
            // clear_all
            // 
            this.clear_all.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.clear_all.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.ActiveBorder;
            this.clear_all.FlatAppearance.MouseOverBackColor = System.Drawing.SystemColors.ActiveBorder;
            this.clear_all.Font = new System.Drawing.Font("宋体", 36F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.clear_all.Location = new System.Drawing.Point(714, 505);
            this.clear_all.Name = "clear_all";
            this.clear_all.Size = new System.Drawing.Size(279, 88);
            this.clear_all.TabIndex = 3;
            this.clear_all.Text = "归零";
            this.clear_all.UseVisualStyleBackColor = false;
            this.clear_all.Click += new System.EventHandler(this.clear_all_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.totalcost);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Font = new System.Drawing.Font("宋体", 15F);
            this.groupBox3.Location = new System.Drawing.Point(12, 493);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(696, 100);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "总价格";
            this.groupBox3.Enter += new System.EventHandler(this.groupBox3_Enter);
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label2.Location = new System.Drawing.Point(659, 44);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(31, 21);
            this.label2.TabIndex = 4;
            this.label2.Text = "元";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // totalcost
            // 
            this.totalcost.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.totalcost.BackColor = System.Drawing.SystemColors.Control;
            this.totalcost.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.totalcost.Enabled = false;
            this.totalcost.Font = new System.Drawing.Font("宋体", 42F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.totalcost.Location = new System.Drawing.Point(275, 25);
            this.totalcost.Name = "totalcost";
            this.totalcost.ReadOnly = true;
            this.totalcost.Size = new System.Drawing.Size(378, 64);
            this.totalcost.TabIndex = 3;
            this.totalcost.TabStop = false;
            this.totalcost.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.totalcost.TextChanged += new System.EventHandler(this.totalcost_TextChanged);
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("宋体", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label4.Location = new System.Drawing.Point(10, 44);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(262, 21);
            this.label4.TabIndex = 2;
            this.label4.Text = "本次购物一共消费人民币￥";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // worktime
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1005, 605);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.clear_all);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.KeyPreview = true;
            this.Name = "worktime";
            this.Text = "营业计费";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.worktime_FormClosing);
            this.Load += new System.EventHandler(this.worktime_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.saleslist)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox lcode_in;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button clear_all;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox totalcost;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView saleslist;
        private System.Windows.Forms.DataGridViewTextBoxColumn lcode_col;
        private System.Windows.Forms.DataGridViewTextBoxColumn sname_col;
        private System.Windows.Forms.DataGridViewTextBoxColumn price_col;
    }
}