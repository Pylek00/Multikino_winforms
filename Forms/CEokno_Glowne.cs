using Multikino_Winforms.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Multikino_Winforms
{
    public partial class CEokno_Glowne : Form
    {

        private int totalSeats;
        private CEwybierz_miejsca ekran_wyb_kasjer;
        private CEzwrot ekran_zwrotu;
        private CERealizacja_rezerwacji ekran_rezerwacji;
        
        public CEokno_Glowne()
        {
            InitializeComponent();
            this.FormClosing += Form_FormClosing;
            totalSeats = 50;
        }
        ~CEokno_Glowne()
        {
            
        }

        private void Czmien_dzien_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Lista_seansow_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void CEokno_Glowne_Load(object sender, EventArgs e)
        {
            labelDzien.Text = "Todays Date: " + dateTimePicker1.Text;

            comboNormalne.Text = "1";
            for (int i = 0; i <= totalSeats; i++)
            {
                comboNormalne.Items.Add(i.ToString());
            }
            for (int i = 0; i <= totalSeats-int.Parse(comboNormalne.Text); i++)
            {
                comboStudenckie.Items.Add(i.ToString());
            }
            for (int i = 0; i <= totalSeats- int.Parse(comboNormalne.Text); i++)
            {
                comboSeniorskie.Items.Add(i.ToString());
            }



        }

        private void Bwybor_miejsc_Click(object sender, EventArgs e)
        {
            this.ekran_wyb_kasjer = new CEwybierz_miejsca(getLiczbaBiletow());
              
            this.Visible = false;
            ekran_wyb_kasjer.Show();
            
            
            
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            
        }

        

        private void label1_Click(object sender, EventArgs e)
        {
            
        }

        private void Bwyloguj_Click(object sender, EventArgs e)
        {

            this.Visible = false;
            ObslugaOkien.idzDo("Logowanie");
            
        }
        void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();

        }

        private void Bprzyjmij_zwrot_Click(object sender, EventArgs e)
        {
            ekran_zwrotu = new CEzwrot();
            ekran_zwrotu.ShowDialog();
        }

        private void Bzrealizuj_rezerwacje_Click(object sender, EventArgs e)
        {
            ekran_rezerwacji = new CERealizacja_rezerwacji();
            ekran_rezerwacji.ShowDialog();
        }

        private void comboStudenckie_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboNormalne.Items.Clear();
            comboSeniorskie.Items.Clear();
            for (int i = 1; i <= totalSeats-int.Parse(comboStudenckie.Text)-int.Parse(comboSeniorskie.Text); i++)
            {
                comboNormalne.Items.Add(i.ToString());
            }

            for (int i = 1; i <= totalSeats - int.Parse(comboStudenckie.Text) - int.Parse(comboNormalne.Text); i++)
            {
                comboSeniorskie.Items.Add(i.ToString());
            }

        }

        private void comboNormalne_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboStudenckie.Items.Clear();
            comboSeniorskie.Items.Clear();
            for (int i = 1; i <= totalSeats - int.Parse(comboNormalne.Text) - int.Parse(comboSeniorskie.Text); i++)
            {
                comboStudenckie.Items.Add(i.ToString());
            }

            for (int i = 1; i <= totalSeats - int.Parse(comboStudenckie.Text) - int.Parse(comboNormalne.Text); i++)
            {
                comboSeniorskie.Items.Add(i.ToString());
            }

        }

        private void comboSeniorskie_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboNormalne.Items.Clear();
            comboStudenckie.Items.Clear();
            for (int i = 1; i <= totalSeats - int.Parse(comboSeniorskie.Text) - int.Parse(comboStudenckie.Text); i++)
            {
                comboNormalne.Items.Add(i.ToString());
            }

            for (int i = 1; i <= totalSeats - int.Parse(comboSeniorskie.Text) - int.Parse(comboNormalne.Text); i++)
            {
                comboStudenckie.Items.Add(i.ToString());
            }

        }
        public int getLiczbaBiletow()
        {
            return int.Parse(comboSeniorskie.Text) + int.Parse(comboNormalne.Text) + int.Parse(comboStudenckie.Text);
        }
    }


    
}
