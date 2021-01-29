﻿using System;
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
        private CEwybor_miejsca_klient ekran_wyb_klient;
        private int liczbaBiletow;
        private int aktualnaLiczbaBiletow;
        private Button[] btn = new Button[50];

        public CEwybierz_miejsca(int liczba_biletow)
        {
            InitializeComponent();
            this.liczbaBiletow = liczba_biletow;
            this.aktualnaLiczbaBiletow = liczba_biletow;
        }

        ~CEwybierz_miejsca()
        {
            //this.ekran_wyb_klient.Close();
        }
        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void CEwybierz_miejsca_Load(object sender, EventArgs e)
        {
            buttonArray();

            ekran_wyb_klient = new CEwybor_miejsca_klient(this.btn,liczbaBiletow);

            ekran_wyb_klient.Visible = true;

            label5.Text = liczbaBiletow.ToString();

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
            

                Button btn1 = (Button)sender;
                if (btn1.BackColor == System.Drawing.Color.Green & aktualnaLiczbaBiletow >0)
                {
                    btn1.BackColor = System.Drawing.Color.Blue;
                    aktualnaLiczbaBiletow--;
                }
                else if (btn1.BackColor == System.Drawing.Color.Blue & aktualnaLiczbaBiletow < liczbaBiletow)
                {
                    btn1.BackColor = System.Drawing.Color.Green;
                    aktualnaLiczbaBiletow++;
                }
                Console.WriteLine("Button clicked");
                ekran_wyb_klient.updateBtnColor(this.btn);

                
                label5.Text = aktualnaLiczbaBiletow.ToString();

        }
    


        private void btn_cofnij_Click(object sender, EventArgs e)
        {
            this.Close();
            ekran_wyb_klient.Close();
            ObslugaOkien.idzDo("Okno Glowne Kasjera");
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btn_dalej_Click(object sender, EventArgs e)
        {
            this.Close();
            ekran_wyb_klient.Close();

        }

        
    }
}
