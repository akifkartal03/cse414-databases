
namespace _171044098_CSE414
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.yemekSepetiDataSet = new _171044098_CSE414.YemekSepetiDataSet();
            this.addressBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.addressTableAdapter = new _171044098_CSE414.YemekSepetiDataSetTableAdapters.AddressTableAdapter();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.textBox15 = new System.Windows.Forms.TextBox();
            this.button16 = new System.Windows.Forms.Button();
            this.button15 = new System.Windows.Forms.Button();
            this.button14 = new System.Windows.Forms.Button();
            this.button13 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.viewsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.triggersToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.joinQueriesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ınheritanceToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.transactionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.storeProcedureToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.yemekSepetiDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.addressBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.groupBox4.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(0, 305);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(0, 0, 0, 100);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(1374, 187);
            this.dataGridView1.TabIndex = 0;
            // 
            // yemekSepetiDataSet
            // 
            this.yemekSepetiDataSet.DataSetName = "YemekSepetiDataSet";
            this.yemekSepetiDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // addressBindingSource
            // 
            this.addressBindingSource.DataMember = "Address";
            this.addressBindingSource.DataSource = this.yemekSepetiDataSet;
            // 
            // addressTableAdapter
            // 
            this.addressTableAdapter.ClearBeforeFill = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(9, 271);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 18);
            this.label1.TabIndex = 5;
            this.label1.Text = "Before";
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(0, 533);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.ReadOnly = true;
            this.dataGridView2.ShowCellErrors = false;
            this.dataGridView2.ShowEditingIcon = false;
            this.dataGridView2.ShowRowErrors = false;
            this.dataGridView2.Size = new System.Drawing.Size(1374, 176);
            this.dataGridView2.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(9, 503);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 18);
            this.label2.TabIndex = 7;
            this.label2.Text = "After";
            // 
            // groupBox4
            // 
            this.groupBox4.BackColor = System.Drawing.Color.DeepPink;
            this.groupBox4.Controls.Add(this.textBox4);
            this.groupBox4.Controls.Add(this.textBox3);
            this.groupBox4.Controls.Add(this.textBox2);
            this.groupBox4.Controls.Add(this.textBox1);
            this.groupBox4.Controls.Add(this.textBox15);
            this.groupBox4.Controls.Add(this.button16);
            this.groupBox4.Controls.Add(this.button15);
            this.groupBox4.Controls.Add(this.button14);
            this.groupBox4.Controls.Add(this.button13);
            this.groupBox4.Controls.Add(this.button4);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox4.Location = new System.Drawing.Point(12, 44);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(1328, 205);
            this.groupBox4.TabIndex = 8;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Views";
            // 
            // textBox15
            // 
            this.textBox15.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox15.Location = new System.Drawing.Point(10, 29);
            this.textBox15.Multiline = true;
            this.textBox15.Name = "textBox15";
            this.textBox15.Size = new System.Drawing.Size(235, 34);
            this.textBox15.TabIndex = 15;
            this.textBox15.Text = "Select * from vm_Customer";
            // 
            // button16
            // 
            this.button16.Location = new System.Drawing.Point(618, 96);
            this.button16.Name = "button16";
            this.button16.Size = new System.Drawing.Size(121, 46);
            this.button16.TabIndex = 5;
            this.button16.Text = "vm_Comment";
            this.button16.UseVisualStyleBackColor = true;
            this.button16.Click += new System.EventHandler(this.button16_Click);
            // 
            // button15
            // 
            this.button15.Location = new System.Drawing.Point(1137, 93);
            this.button15.Name = "button15";
            this.button15.Size = new System.Drawing.Size(121, 46);
            this.button15.TabIndex = 4;
            this.button15.Text = "vm_Restaurant";
            this.button15.UseVisualStyleBackColor = true;
            this.button15.Click += new System.EventHandler(this.button15_Click);
            // 
            // button14
            // 
            this.button14.Location = new System.Drawing.Point(889, 99);
            this.button14.Name = "button14";
            this.button14.Size = new System.Drawing.Size(128, 46);
            this.button14.TabIndex = 3;
            this.button14.Text = "vm_Max40Food";
            this.button14.UseVisualStyleBackColor = true;
            this.button14.Click += new System.EventHandler(this.button14_Click);
            // 
            // button13
            // 
            this.button13.Location = new System.Drawing.Point(334, 93);
            this.button13.Name = "button13";
            this.button13.Size = new System.Drawing.Size(128, 46);
            this.button13.TabIndex = 2;
            this.button13.Text = "vm_Order";
            this.button13.UseVisualStyleBackColor = true;
            this.button13.Click += new System.EventHandler(this.button13_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(38, 99);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(118, 40);
            this.button4.TabIndex = 1;
            this.button4.Text = "vm_Customer";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.viewsToolStripMenuItem,
            this.triggersToolStripMenuItem,
            this.joinQueriesToolStripMenuItem,
            this.ınheritanceToolStripMenuItem,
            this.transactionToolStripMenuItem,
            this.storeProcedureToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1374, 24);
            this.menuStrip1.TabIndex = 10;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // viewsToolStripMenuItem
            // 
            this.viewsToolStripMenuItem.Name = "viewsToolStripMenuItem";
            this.viewsToolStripMenuItem.Size = new System.Drawing.Size(49, 20);
            this.viewsToolStripMenuItem.Text = "Views";
            this.viewsToolStripMenuItem.Click += new System.EventHandler(this.viewsToolStripMenuItem_Click);
            // 
            // triggersToolStripMenuItem
            // 
            this.triggersToolStripMenuItem.Name = "triggersToolStripMenuItem";
            this.triggersToolStripMenuItem.Size = new System.Drawing.Size(60, 20);
            this.triggersToolStripMenuItem.Text = "Triggers";
            this.triggersToolStripMenuItem.Click += new System.EventHandler(this.triggersToolStripMenuItem_Click);
            // 
            // joinQueriesToolStripMenuItem
            // 
            this.joinQueriesToolStripMenuItem.Name = "joinQueriesToolStripMenuItem";
            this.joinQueriesToolStripMenuItem.Size = new System.Drawing.Size(83, 20);
            this.joinQueriesToolStripMenuItem.Text = "Join Queries";
            this.joinQueriesToolStripMenuItem.Click += new System.EventHandler(this.joinQueriesToolStripMenuItem_Click);
            // 
            // ınheritanceToolStripMenuItem
            // 
            this.ınheritanceToolStripMenuItem.Name = "ınheritanceToolStripMenuItem";
            this.ınheritanceToolStripMenuItem.Size = new System.Drawing.Size(78, 20);
            this.ınheritanceToolStripMenuItem.Text = "Inheritance";
            this.ınheritanceToolStripMenuItem.Click += new System.EventHandler(this.ınheritanceToolStripMenuItem_Click);
            // 
            // transactionToolStripMenuItem
            // 
            this.transactionToolStripMenuItem.Name = "transactionToolStripMenuItem";
            this.transactionToolStripMenuItem.Size = new System.Drawing.Size(79, 20);
            this.transactionToolStripMenuItem.Text = "Transaction";
            this.transactionToolStripMenuItem.Click += new System.EventHandler(this.transactionToolStripMenuItem_Click);
            // 
            // storeProcedureToolStripMenuItem
            // 
            this.storeProcedureToolStripMenuItem.Name = "storeProcedureToolStripMenuItem";
            this.storeProcedureToolStripMenuItem.Size = new System.Drawing.Size(103, 20);
            this.storeProcedureToolStripMenuItem.Text = "Store Procedure";
            this.storeProcedureToolStripMenuItem.Click += new System.EventHandler(this.storeProcedureToolStripMenuItem_Click);
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(288, 29);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(235, 34);
            this.textBox1.TabIndex = 16;
            this.textBox1.Text = "Select * from vm_Order";
            // 
            // textBox2
            // 
            this.textBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.Location = new System.Drawing.Point(552, 29);
            this.textBox2.Multiline = true;
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(235, 34);
            this.textBox2.TabIndex = 17;
            this.textBox2.Text = "Select * from vm_Comment";
            // 
            // textBox3
            // 
            this.textBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.Location = new System.Drawing.Point(822, 29);
            this.textBox3.Multiline = true;
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(235, 34);
            this.textBox3.TabIndex = 18;
            this.textBox3.Text = "Select * from vm_Max40Food";
            // 
            // textBox4
            // 
            this.textBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox4.Location = new System.Drawing.Point(1072, 29);
            this.textBox4.Multiline = true;
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(235, 34);
            this.textBox4.TabIndex = 19;
            this.textBox4.Text = "Select * from vm_Restaurant";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1374, 721);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.Text = "YemekSepeti";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.yemekSepetiDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.addressBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private YemekSepetiDataSet yemekSepetiDataSet;
        private System.Windows.Forms.BindingSource addressBindingSource;
        private YemekSepetiDataSetTableAdapters.AddressTableAdapter addressTableAdapter;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button16;
        private System.Windows.Forms.Button button15;
        private System.Windows.Forms.Button button14;
        private System.Windows.Forms.Button button13;
        private System.Windows.Forms.TextBox textBox15;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem viewsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem triggersToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem joinQueriesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ınheritanceToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem transactionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem storeProcedureToolStripMenuItem;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
    }
}

