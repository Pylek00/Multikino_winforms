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
    public partial class CELogowanie : Form
    {
        private CEokno_Glowne ekran_glowny;
        private bool correct_login;
        public CELogowanie()
        {
            
            InitializeComponent();
            this.correct_login = false;

        }

        private void CELogowanie_Load(object sender, EventArgs e)
        {
            TID_Kasjera.Text = "pawel";
            THaslo.Text = "lekan";
        }

        private void BLogowanie_Click(object sender, EventArgs e)
        {
            if (TID_Kasjera.Text.Equals("pawel") & THaslo.Text.Equals("lekan"))
            {
                if (true)
                {
                    this.ekran_glowny = new CEokno_Glowne();
                    this.ekran_glowny.Show();
                }
                correct_login = true;
                //this.Dispose();
                this.Visible = false;
                //ObslugaOkien.idzDo("Okno Glowne Kasjera");
            }
            else
            {
                LInformacje_logowania.Text = "Bledne wprowadzone haslo lub ID kasjera. Sprobuj Ponownie!";
            }
        }

        private void LHaslo_Click(object sender, EventArgs e)
        {

        }

        private void ID_kasjera_Click(object sender, EventArgs e)
        {

        }

        private void TID_Kasjera_TextChanged(object sender, EventArgs e)
        {

        }

        private void THaslo_TextChanged(object sender, EventArgs e)
        {

        }
        public bool getCorrectLogin()
        {
            return correct_login;
        }
        
    }
}
