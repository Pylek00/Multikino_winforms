using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Multikino_Winforms;


namespace Multikino_Winforms.Forms
{
    public partial class CEwybierz_miejsca : Form
    {


        private Button[] btn = new Button[50];

        public CEwybierz_miejsca()
        {
            InitializeComponent();
        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void CEwybierz_miejsca_Load(object sender, EventArgs e)
        {
            buttonArray();

            //if (cEwybierz_miejsca.IsDisposed & cEwybor_miejsca_klient.IsDisposed)
            //{
            //    this.Visible = true;
            //}

        }


        public void buttonArray()
        {
            int j = 1;
            char c = 'A';
            for (int i = 0; i <= 49; i++)
            {
                if (j >10)
                {
                    j = 1;
                    c++;
                }
                btn[i] = new Button();
                btn[i].Size = new Size(40,40);

                btn[i].BackColor = System.Drawing.Color.Green;
                btn[i].Text = c.ToString()+(j).ToString();
                btn[i].Click += btn_Click;
                flowLayoutPanel1.Controls.Add(btn[i]);
                j++;
            }
            
        }
        public void btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.BackColor == System.Drawing.Color.Green)
            {
                btn.BackColor = System.Drawing.Color.Blue;
            }
            else if (btn.BackColor == System.Drawing.Color.Blue)
            {
                btn.BackColor = System.Drawing.Color.Green;
            }
            
        }


        private void btn_cofnij_Click(object sender, EventArgs e)
        {
            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
