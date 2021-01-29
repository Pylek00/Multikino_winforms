using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Multikino_Winforms.Forms;

namespace Multikino_Winforms
{
    class CCentrum_Wszechswiata 
    {
        

        private CELogowanie ekran_logowania;
        

        public CCentrum_Wszechswiata()
        {
            
            
        }
         ~CCentrum_Wszechswiata()
        {

        }
        public void run()
        {

            Application.Run(ekran_logowania);


        }
        public bool stop_this()
        {
            return true;
        }
    }
}
