using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Multikino_Winforms.Forms;

namespace Multikino_Winforms
{
    class CCentrum_Wszechswiata : ApplicationContext
    {
        

        public CELogowanie ekran_logowania;
        private CEokno_Glowne ekran_glowny;
        private CEwybierz_miejsca ekran_miejsca_kasjer;
        private CEwybor_miejsca_klient ekran_miejsca_klient;

        public CCentrum_Wszechswiata()
        {
            ekran_logowania = new CELogowanie();
            ekran_glowny = new CEokno_Glowne();
            ekran_glowny.Hide();
            ekran_miejsca_kasjer = new CEwybierz_miejsca();
            ekran_miejsca_kasjer.Hide();
            ekran_miejsca_klient = new CEwybor_miejsca_klient();
            ekran_miejsca_klient.Hide();

            this.run();
        }
        public void run()
        {
            
            

        }
        public bool stop_this()
        {
            return true;
        }
    }
}
